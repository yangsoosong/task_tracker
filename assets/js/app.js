// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.scss"
import jQuery from 'jquery';
window.jQuery = window.$ = jQuery;
import "bootstrap";
// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"
//

$(function () {
  let start = null
  let stop = null

  $('#start-timeblock').click(() => {
    start = new Date()
  });

  $('#stop-timeblock').click(() => {
    stop = new Date()
    $.ajax("/ajax/timeblocks", {
      method: "post",
      datatype: "json",
      contentType: "application/json; charset=UTF-8",
      data: JSON.stringify({
        timeblock: {
          start: start,
          end: stop,
          task_id: window.task_id,
        }
      }),
      success: (resp) => {location.reload()},
    });
  });

  $('#save-timeblock').click((ev) => {
    let id = $(ev.target).data("tb-id")
    let row = $(ev.target).closest(".tb-edit")
    let start_field = row.find("#edit-start")
    let stop_field = row.find("#edit-end")
    $.ajax("/ajax/timeblocks/"+id, {
      method: "put",
      datatype: "json",
      contentType: "application/json; charset=UTF-8",
      data: JSON.stringify({
        timeblock: {
          start: $(start_field).val(),
          end: $(stop_field).val(),
          task_id: window.task_id,
        }
      }),
      success: (resp) => {},
      error: (resp) => {alert("An error occurred")}
    });
  });
});
