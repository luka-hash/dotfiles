// ==UserScript==
// @name         Playback Speed Control
// @namespace    http://tampermonkey.net/
// @version      0.2
// @description  mpv inspired playback speed control
// @author       github.com/luka-hash
// @match        https://www.youtube.com/*
// @icon         https://www.google.com/s2/favicons?sz=64&domain=youtube.com
// @grant        none
// ==/UserScript==

(function() {
  'use strict';
  const video = document.getElementsByTagName("video")[0];
  if (video!==undefined){
      document.onkeydown = (e)=>{
          if (e.key==="[") {
              video.playbackRate = parseFloat((video.playbackRate - parseFloat(0.1.toFixed(1)))) > 0 ? parseFloat((video.playbackRate - parseFloat(0.1.toFixed(1))).toFixed(1)) : video.playbackRate;
          }else if (e.key==="]") {
              video.playbackRate = parseFloat((video.playbackRate + parseFloat(0.1.toFixed(1))).toFixed(1)) ;
          }else if (e.key==="Backspace") {
              video.playbackRate = 1;
          }
          //console.log(video.playbackRate);
      }
  }
})();
