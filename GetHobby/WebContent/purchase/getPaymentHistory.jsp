<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<%-- //2020-02-24 Git Commit --%>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>  
  <link rel="stylesheet" href="/resources/css/purchase.css">
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>		
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  <!-- Scrollbar Custom CSS -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
    <!-- jQuery Custom Scroller CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>

	<!-- 공통 CSS -->
    <link rel="stylesheet" href="/resources/css/commonHeader.css">
    <script src="/resources/javascript/commonHeader.js"></script>
    
<style>

.eHZNoL {
    position: relative;
    margin: 0px 32px;
}
.eHZNoL {
    padding-bottom: 72px;
    margin: 0px;
    overflow: hidden;
}
.eHZNoL::before {
    position: absolute;
    content: "";
    display: block;
    background-color: rgb(27, 28, 29);
    width: calc(100% + 64px);
    height: 100%;
    top: 0px;
    left: -32px;
}
.inUTcF {
    position: relative;
    margin-left: auto;
    margin-right: auto;
}
.inUTcF {
    margin-left: 24px;
    margin-right: 24px;
}
.cPBtQc {
    padding: 8px 0px 32px;
}
.QtLBl {
    display: flex;
    flex-wrap: wrap;
    -webkit-box-pack: start;
    justify-content: flex-start;
    align-content: stretch;
    margin-right: -12px;
    margin-left: -12px;
}
.QtLBl {
    margin-right: -4px;
    margin-left: -4px;
}
.bXMAOt {
    position: relative;
    min-height: 1px;
    padding-right: 12px;
    padding-left: 12px;
    box-sizing: border-box;
}
.bXMAOt {
    width: 100%;
    padding-right: 4px;
    padding-left: 4px;
}
.bXMAOt {
    width: 100%;
}
.ekuQEe {
    margin-top: 24px;
}
.fORXCH {
    font-size: 14px;
    font-weight: bold;
    color: rgb(255, 255, 255);
    line-height: 20px;
    letter-spacing: -0.2px;
    margin: 0px;
}
a {
    color: inherit;
    text-decoration: none;
}
.hGKcXL {
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    margin-top: 8px;
}
.hBKkTB {
    font-size: 14px;
    font-weight: normal;
    color: rgb(62, 64, 66);
    line-height: 20px;
    letter-spacing: -0.2px;
    margin: 0px;
}
.liAQRm {
    color: rgb(133, 138, 141);
    flex: 1 1 0%;
}
.etHvQm {
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    margin-top: 8px;
}
.bXMAOt {
    position: relative;
    min-height: 1px;
    padding-right: 12px;
    padding-left: 12px;
    box-sizing: border-box;
}
.bXMAOt {
    width: 33.3333%;
}
.fORXCH {
    font-size: 14px;
    font-weight: bold;
    color: rgb(255, 255, 255);
    line-height: 20px;
    letter-spacing: -0.2px;
    margin: 0px;
}
.hGKcXL {
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    margin-top: 8px;
}
.hGKcXL:hover {
    text-decoration: none;
}
.hBKkTB {
    font-size: 14px;
    font-weight: normal;
    color: rgb(62, 64, 66);
    line-height: 20px;
    letter-spacing: -0.2px;
    margin: 0px;
}
.liAQRm {
    color: rgb(133, 138, 141);
    flex: 1 1 0%;
}
.etHvQm {
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    margin-top: 8px;
}
.htmEMd {
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    margin-bottom: 8px;
}
.dVjooD {
    font-size: 11px;
    font-weight: normal;
    color: rgb(62, 64, 66);
    line-height: 16px;
    letter-spacing: normal;
    margin: 0px;
}
.enPSFa {
    color: rgb(133, 138, 141);
    margin-left: 8px;
}
.fsfjPC {
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    margin-bottom: 0px;
}
button, select {
    text-transform: none;
}
button, input, optgroup, select, textarea {
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
    line-height: inherit;
    margin: 0px;
}
.flMyeK {
    box-sizing: border-box;
    display: flex;
    -webkit-box-pack: center;
    justify-content: center;
    -webkit-box-align: center;
    align-items: center;
    flex-direction: row;
    border-width: 0px;
    border-style: initial;
    border-color: initial;
    border-image: initial;
    outline: none;
    margin: 0px;
    padding: 0px;
    flex: initial;
}
.gQbfLi {
    width: auto;
    display: inline-flex;
    vertical-align: middle;
    color: rgb(62, 64, 66);
    background-color: rgb(248, 248, 249);
    font-weight: 500;
    font-size: 14px;
    letter-spacing: -0.2px;
    height: 40px;
    text-decoration-line: none;
    border-radius: 3px;
    padding: 0px 16px;
    transition: background-color 0.1s ease 0s;
}
.glrvQb {
    background-color: transparent !important;
    border-width: 1px;
    border-style: solid;
    border-color: rgb(97, 101, 104);
    border-image: initial;
    flex: 1 1 0%;
}
button, html [type="button"], [type="reset"], [type="submit"] {
    -webkit-appearance: button;
}
.flMyeK:not(:disabled):not(.disabled) {
    cursor: pointer;
}
.jIpzzf {
    display: flex;
    -webkit-box-pack: center;
    justify-content: center;
    -webkit-box-align: center;
    align-items: center;
    font-size: 0px;
    width: 18px;
    height: 18px;
    margin-right: 4px;
    flex: 0 0 auto;
}
svg[Attributes Style] {
    width: 18;
    height: 18;
}
path[Attributes Style] {
    fill: rgb(62, 64, 66);
    fill-rule: evenodd;
    d: path("M 12 4 c -4.97 0 -9 3.185 -9 7.115 c 0 2.557 1.707 4.8 4.27 6.054 c -0.188 0.702 -0.682 2.545 -0.78 2.94 c -0.123 0.49 0.178 0.483 0.376 0.351 c 0.155 -0.103 2.466 -1.675 3.464 -2.353 c 0.541 0.08 1.1 0.123 1.67 0.123 c 4.97 0 9 -3.186 9 -7.115 C 21 7.185 16.97 4 12 4");
}
.kCztpU {
    display: flex;
    -webkit-box-pack: center;
    justify-content: center;
    -webkit-box-align: center;
    align-items: center;
    flex: 0 0 auto;
}
.itsnFS {
    font-size: 14px;
    font-weight: normal;
    color: rgb(255, 255, 255);
    line-height: 20px;
    letter-spacing: -0.2px;
    margin: 0px;
}
.glrvQb .Footer__Title-lv6cz2-4 {
    display: inline-block;
}
.jmEzjg {
    margin-top: 32px;
}
.foMYrC {
    font-size: 11px;
    font-weight: bold;
    color: rgb(255, 255, 255);
    line-height: 16px;
    letter-spacing: normal;
    margin: 0px;
}
.cMfRMs {
    margin-bottom: 4px;
}
.cLkRRa {
    overflow: hidden;
}
.bsSxNz {
    margin-left: -24px;
}
.gPalxu {
    position: relative;
    min-height: 1px;
    padding-right: 12px;
    padding-left: 12px;
    box-sizing: border-box;
}
.gPalxu {
    width: 66.6667%;
}
.hMCBZf {
    margin-top: 24px;
}
.dVjooD {
    font-size: 11px;
    font-weight: normal;
    color: rgb(62, 64, 66);
    line-height: 16px;
    letter-spacing: normal;
    margin: 0px;
}
.iIxncl {
    color: rgb(133, 138, 141);
    margin-left: 0px;
}

/* /* /* /* /* /* /* /* /* /* /* /* /* /* /* modal */ 
*, ::before, ::after {
    box-sizing: border-box;
}
.hupVkE {
    background-color: rgba(0, 0, 0, 0.8);
    position: fixed;
    left: 0px;
    right: 0px;
    top: 0px;
    bottom: 0px;
    display: block;
    z-index: 3000;
    opacity: 1.1;
    animation: 0.25s ease 0s 1 normal none running openOverlay;
}
.jOWGnl {
    position: fixed;
    overflow-y: auto;
    z-index: 3001;
    box-shadow: rgba(0, 0, 0, 0.08) 0px 3px 6px 0px, rgba(0, 0, 0, 0.12) 0px 8px 16px 0px;
    padding: 24px;
    background: rgb(255, 255, 255);
}
.jOWGnl {
    top: 50%;
    left: 50%;
    width: 480px;
    transform: translate(-50%, -50.1%);
    max-height: 95%;
    animation: 0.25s ease 0s 1 normal none running openModal;
    padding: 32px 24px;
}
h1.Dialog__DialogTitle-r2swbb-3.bfIgvr {
    display: block;
    font-size: 2em;
    margin-block-start: 0.67em;
    margin-block-end: 0.67em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}
h1.Dialog__DialogTitle-r2swbb-3.bfIgvr {
    color: rgb(24, 32, 38);
    font-weight: 600;
    line-height: 40px;
    font-size: 36px;
    margin: 0px 0px 10px;
    padding: 0px;
}
.bfIgvr {
    font-size: 24px;
    font-weight: bold;
    color: rgb(62, 64, 66);
    line-height: 32px;
    letter-spacing: -0.4px;
    display: flex;
    margin: 0px 0px 8px;
}
.buRgcP {
    -webkit-box-flex: 1;
    flex-grow: 1;
}
.hwZSXH {
    width: 24px;
    height: 24px;
    cursor: pointer;
    flex: 0 0 auto;
}
svg[Attributes Style] {
    width: 24;
    height: 24;
}
/* :not(svg) {
    transform-origin: 0px 0px;
} */
path[Attributes Style] {
    d: path("M 17.59 5 L 12 10.59 L 6.41 5 L 5 6.41 L 10.59 12 L 5 17.59 L 6.41 19 L 12 13.41 L 17.59 19 L 19 17.59 L 13.41 12 L 19 6.41 Z");
}
use[Attributes Style] {
    fill: rgb(168, 174, 179);
    fill-rule: evenodd;
}
path[Attributes Style] {
    d: path("M 17.59 5 L 12 10.59 L 6.41 5 L 5 6.41 L 10.59 12 L 5 17.59 L 6.41 19 L 12 13.41 L 17.59 19 L 19 17.59 L 13.41 12 L 19 6.41 Z");
}
.bgUEhx {
    font-size: 14px;
    font-weight: normal;
    color: rgb(97, 101, 104);
    line-height: 20px;
    letter-spacing: -0.2px;
    margin: 0px;
}
.bhsFBo {
    margin-top: 40px;
}
h4.sc-bdVaJa.cZzCCw {
    display: block;
    margin-block-start: 1.33em;
    margin-block-end: 1.33em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}
h4.sc-bdVaJa.cZzCCw {
    color: rgb(24, 32, 38);
    font-weight: 600;
    line-height: 21px;
    font-size: 18px;
    margin: 0px 0px 10px;
    padding: 0px;
}
.cZzCCw {
    font-size: 20px;
    font-weight: bold;
    color: rgb(62, 64, 66);
    line-height: 28px;
    letter-spacing: -0.3px;
    margin: 0px;
}
.icaGGS {
    font-size: 14px;
    font-weight: normal;
    line-height: 20px;
    letter-spacing: -0.2px;
    color: rgb(62, 64, 66);
    margin: 8px 0px 4px;
}
.gSDjRJ {
    display: block;
}
textarea {
    -webkit-writing-mode: horizontal-tb !important;
    text-rendering: auto;
    color: -internal-light-dark-color(black, white);
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: start;
    -webkit-appearance: textarea;
    background-color: -internal-light-dark-color(white, black);
    -webkit-rtl-ordering: logical;
    flex-direction: column;
    resize: auto;
    cursor: text;
    white-space: pre-wrap;
    overflow-wrap: break-word;
    margin: 0em;
    font: 400 13.3333px Arial;
    border-width: 1px;
    border-style: solid;
    border-color: rgb(169, 169, 169);
    border-image: initial;
    padding: 2px;
}
textarea {
    resize: vertical;
    overflow: auto;
}
button, input, optgroup, select, textarea {
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
    line-height: inherit;
    margin: 0px;
}
.jvXgFF {
    font-size: 14px;
    font-weight: normal;
    line-height: 20px;
    letter-spacing: -0.2px;
    color: rgb(62, 64, 66);
    background-color: white;
    width: 100%;
    height: 104px;
    box-sizing: border-box;
    margin: 0px;
    border-radius: 1px;
    border-width: 1px;
    border-style: solid;
    border-color: rgb(205, 209, 212);
    border-image: initial;
    padding: 12px 16px;
}
.bqVawJ {
    display: flex;
    flex-direction: row;
    margin-top: 16px;
    flex: 1 1 0%;
}
.hBKkTB {
    font-size: 14px;
    font-weight: normal;
    color: rgb(62, 64, 66);
    line-height: 20px;
    letter-spacing: -0.2px;
    margin: 0px;
}
.kdHuLt {
    display: flex;
    flex-direction: row;
    -webkit-box-align: center;
    align-items: center;
    cursor: pointer;
    margin-left: 8px;
}
.jGfUCZ {
    font-size: 14px;
    font-weight: normal;
    color: rgb(253, 126, 20);
    line-height: 20px;
    letter-spacing: -0.2px;
    margin: 0px;
}
path[Attributes Style] {
    fill: rgb(253, 126, 20);
    fill-rule: evenodd;
    d: path("M 8.5 18.5 l 6 -6.5 l -6 -6.5 L 10 4 l 7.5 8 l -7.5 8 Z");
}
.ldmqLR {
    margin-top: 63px;
}
.kghFfp {
    font-size: 16px;
    font-weight: bold;
    color: rgb(62, 64, 66);
    line-height: 24px;
    letter-spacing: -0.2px;
    margin: 0px;
}
.cLtGPj {
    width: 100%;
    display: flex;
    vertical-align: middle;
    color: rgb(62, 64, 66);
    background-color: rgb(248, 248, 249);
    font-weight: 500;
    font-size: 14px;
    letter-spacing: -0.2px;
    height: 40px;
    text-decoration-line: none;
    border-radius: 3px;
    padding: 0px 16px;
    transition: background-color 0.1s ease 0s;
}
.gAbriU {
    margin-top: 8px;
}
.flMyeK:not(:disabled):not(.disabled) {
    cursor: pointer;
}

.swal2-container {
   z-index : 10000;
}
.fIJpfD {
    width: 100%;
    display: flex;
    vertical-align: middle;
    color: rgb(255, 255, 255);
    background-color: rgb(255, 146, 43);
    font-weight: 500;
    font-size: 14px;
    letter-spacing: -0.2px;
    height: 40px;
    text-decoration-line: none;
    border-radius: 3px;
    padding: 0px 16px;
    transition: background-color 0.1s ease 0s;
}
.fIJpfC:hover {
	filter: hue-rotate(-12deg) brightness(97%);
}
.cNzNJq:hover {
	filter: hue-rotate(-12deg) brightness(97%);
}
.nono{
	background-color: #f3b368;
}
	body{
		margin: 0px;
		padding: 0px;
	}
	@media (max-width: 660px) {
   		.paymentHistory-main-div {
	   		display: block;
	    	margin-top: 0em;
	    	width: 100%;
	    	margin: auto;
	    	padding: 0px 24px;
   		}
   		.paymentHistory-content-div {
			margin: auto;
			width: 100%;
		}
		.gso-hea-nav {
  			position: relative;
  			width: 100%;
  			margin-left: 0px;
  		}
   	}
	@media (min-width: 661px) {
		.paymentHistory-main-div {
	   		display: block;
	    	margin-top: 0em;
	    	width: 640px;
	    	margin: auto;	
   		}
   		.paymentHistory-content-div {
			margin: auto;
			width: 640px;
		}
		.gso-hea-nav {
 			position: relative;
 			width: 640px;
 			margin-left: 0px;
 		}
   	}
   	.paymentHistory-title-div{
   		position: relative;
	    background-color: rgb(255, 255, 255);
	    padding: 24px;
   	}
   	.paymentHistory-title-title {
   		font-size: 11px;
	    font-weight: normal;
	    line-height: 16px;
	    letter-spacing: normal;
	    color: rgb(133, 138, 141);
	    margin: 0px;
	    padding: 0px;
	    position: relative;
	    width: 100%;
	    height: 18px;
   	}
   	.paymentHistory-title-content {
   		display: flex;
	    flex-direction: row;
	    -webkit-box-pack: justify;
	    justify-content: space-between;
	    -webkit-box-align: center;
	    align-items: center;
	    margin-top: 12px;
   	}
   	.title-same {
   		font-size: 11px;
	    font-weight: normal;
	    line-height: 16px;
	    letter-spacing: normal;
	    color: rgb(133, 138, 141);
	    padding: 0px;
	    display: inline-block;
	    
   	}
   	.title-same-div {
   		
   	}
   	
   	.title-noSame {
   		color: rgb(27, 28, 29);
   	}
   	.title-content-div {
   		display: flex;
	    flex-direction: row;
	    -webkit-box-pack: justify;
	    justify-content: space-between;
	    -webkit-box-align: center;
	    align-items: center;
   	}
   	.title-content-spanOne{
   		font-size: 20px;
	    font-weight: bold;
	    color: rgb(62, 64, 66);
	    line-height: 28px;
	    letter-spacing: -0.3px;
	    margin: 0px;
   	}
   	.title-content-spanTwo{
   		font-size: 14px;
	    font-weight: normal;
	    line-height: 20px;
	    letter-spacing: -0.2px;
	    color: rgb(133, 138, 141);
	    margin: 0px 0px 0px 8px;
   	}
   	.title-a-same{
   		font-size: 11px;
	    font-weight: normal;
	    line-height: 16px;
	    letter-spacing: normal;
	    color: inherit;
	    margin: 0px;
	    vertical-align: middle;
   	}
   	.history-blank-div {
   		background-color: rgb(248, 248, 249);
	    width: 100%;
	    height: 8px;
   	}
   	.history-blank-line-div {
   		background-color: rgb(248, 248, 249);
	    width: 100%;
	    height: 10px;
   	}
   	.history-content-blank-div {
   		background-color: rgb(248, 248, 249);
	    width: 100%;
	    height: 2px;
   	}
   	.noBuyClass-div {
   		display: flex;
	    flex-direction: column;
	    -webkit-box-pack: center;
	    justify-content: center;
	    -webkit-box-align: center;
	    align-items: center;
	    height: 100%;
	    width: 100%;
	    padding-top: 16px;
	    padding-bottom: 52px;
   	}
   	.noBuyImage {
   		vertical-align: middle;
	    border-style: none;
	    width: 40%;
   	}
   	.noBuyClass-span {
   		font-size: 16px;
	    color: rgb(168, 174, 179);
	    font-weight: 300;
   	}
   	.history-content-section {
   		padding: 20px 24px;
   	}
   	.history-content-button-text {
		font-size: 14px;
	    font-weight: normal;
	    color: rgb(62, 64, 66);
	    line-height: 20px;
	    letter-spacing: -0.2px;
	    vertical-align: middle;
	    margin: 0px;
	    text-align: center;
	    -webkit-box-align: center;
	}
	
	.history-content-button-buy {
		position: relative;
	    width: 100%;

	    text-align: left;
	    padding: 12px 16px;
	    border-width: 0px;
	    border-style: initial;
	    border-color: initial;
	    border-image: initial;
	    outline: none;   
	    font-family: inherit;			
	    cursor: pointer;
	    background-color: rgb(255, 146, 43);
	}
	.history-content-button-buy-text {
		font-size: 14px;
	    font-weight: normal;
	    color: rgb(62, 64, 66);
	    line-height: 20px;
	    letter-spacing: -0.2px;
	    vertical-align: middle;
	    margin: 0px;
	    text-align: center;
	    -webkit-box-align: center;
	}
	
	.history-content-button {
		position: relative;
	    width: 100%;

	    text-align: left;
	    padding: 12px 16px;
	    border-width: 0px;
	    border-style: initial;
	    border-color: initial;
	    border-image: initial;
	    outline: none;   
	    font-family: inherit;			
	    cursor: pointer;
	    background-color: rgb(213, 218, 221);
	}
	.history-content-section-top {
		width:100%;
		padding:0px;
		margin-top: 20px;
	}
	.history-content-section-in {
		
	}
	.history-content-title-h4 {
		margin-bottom: 10px;
		margin-top: 0px;
	}
	.history-content-kit-title-h4 {
		margin-bottom: 10px;
		margin-top: 0px;
		color: rgb(42, 143, 180);
		font-size: 14px;
	    font-weight: normal;
	    line-height: 20px;
	    letter-spacing: -0.2px;
	}
	.history-content-div-out {
		display: flex;
	    flex-direction: row;
	    align-items: flex-start;
	    align-content: flex-start;
	    margin-bottom: 16px;
	}
	.history-content-div-out-exit {
		display: flex;
	    flex-direction: row;
	    align-items: flex-start;
	    align-content: flex-start;
	}
	.history-content-div-in-image {
		width: 120px;
		height: 90px;
		float: left;
		margin-right: 16px;
	}
	.history-content-div-kit-image {
		width: 120px;
		height: 100px;
		float: left;
		margin-right: 16px;
	}
	.history-content-div-in-content {
		float: left;
	}
	.history-content-div-in-content-title {
		font-size: 14px;
	    font-size: 14px;
	    font-weight: normal;
	    line-height: 20px;
	    letter-spacing: -0.2px;
	    color: rgb(62, 64, 66);
	}
	.history-content-div-in-content-content {
		font-size: 11px;
	    font-weight: normal;
	    line-height: 8px;
	    letter-spacing: normal;
	    color: rgb(168, 174, 179);
	    white-space: pre-line;
	    
	}
	.history-content-top-title {
		display: flex;
	    -webkit-box-pack: justify;
	    justify-content: space-between;
	    -webkit-box-align: center;
	    align-items: center;
	    flex-wrap: wrap;
	    padding: 14px 0px;	
	}
	.history-content-top-title-one {
		-webkit-box-flex: 1;
	    flex-grow: 1;
	    display: flex;
	    -webkit-box-align: center;
	    align-items: center;
	    font-size: 14px;
	    
	}
	.history-content-top-title-button {
		-webkit-appearance: button;
		display: inline-flex;
	    vertical-align: middle;
	    font-size: 14px;
	    font-weight: 500;
	    line-height: 20px;
	    letter-spacing: -0.2px;
	    background: none;
	    transition: color 0.1s ease 0s;
	    border: 0;
	    outline: none;
	    color: rgb(253, 126, 20);
	    cursor: pointer;
	}
	.text-left {
		text-align: left;
	}
	footer{
		padding: 0px;
	}
	.header-title-menu-div{
		display:none;
	}
	.header-navbar {
		
	}
</style>


</head>
<body>

	<input type="hidden" id="maxPage" value="${purchaseMap.maxPage}">
	<div class="paymentHistory-main-div">
	
	<!---------- Header Start ---------->
	<nav class="navbar navbar-expand-lg navbar-light bg-light header-navbar gso-hea-nav">
               <div class="container-fluid" style="padding:0px 16px; background-color:black; height:100%; width:100%;">

                   <div id="sidebarCollapse" class="test" style="border:0; outline:none; background-color: black; display:flex; justify-content: left;">   
                   	                    
					<img src="/resources/image/logo/logo-favicon.png">	
					<a href="/index.jsp" style="text-decoration:none; float:left; color:white; font-size:22px; font-weight:bold; line-height:32px; margin-left:12px; etter-spacing: -0.4px;">
                   	  GetHobby
                   </a>
                   </div>
					<div style="display: flex; justify-content: right;">

                   <c:if test="${ ! empty sessionScope.user }">
                   <div style="margin:0px 24px; padding:0px; color:white; font-size:24px; font-weight:bold; line-height:32px; etter-spacing: -0.4px;">
                   		
                   		<!-- 프로필 -->
			            <div class="dropdown d-flex justify-content-end">
			                <div class="dropdown-icon header-mynemo-check-mylist" data-toggle="dropdown" aria-expanded="false" style="justify-content: space-between; display:flex; align-items: center;">
			                	<span class="header-mynemo-first-span">
			                    	<img src="../resources/image/logo/${!empty sessionScope.user.profileImage ? sessionScope.user.profileImage : 'unnamed.jpg'}" class="header-mynemo-proimage-image" onError="this.src='/resources/image/min/default-profile.jpg'">
			                    </span>
			                    
			                    <div class="header-mynemo-profile-flow-one fa-angle-down">
									<svg xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 0 24 24" width="24">
										<path d="M12 8l-6 6 1.41 1.41L12 10.83l4.59 4.58L18 14z" fill="#ffffff"/>
										<path d="M0 0h24v24H0z" fill="none"/>
									</svg>
								</div>
			                </div>
			
							<!-- 마이페이지 미니메뉴 -->
							<div class="dropdown-menu dropdown-menu-right header-dropdown mt-3 p-2 border-0 first-load-div" style="position:absolute; top: -100px;">
				                <div class="header-mynemo-out-div">
					                <a class="header-mynemo-first-a" href="/user/mypageUser" style="text-decoration:none;">
						                <span class="header-mynemo-first-span">
						                	<img src="../resources/image/logo/${!empty user.profileImage ? user.profileImage : 'unnamed.jpg'}" class="header-mynemo-proimage-image" onError="this.src='/resources/image/min/default-profile.jpg'">
						                </span>
						                <div class="header-mynemo-span-next-first-div">
							                <div class="header-mynemo-span-next-first-div-in-div" >
							                	${sessionScope.user.nickName}
							                </div>
							                <span class="header-mynemo-span-next-first-div-in-span">
								                <div color="#fd7e14" class="header-mynemo-span-next-first-div-in-mypage-text">
								                	마이페이지
								                </div>
								                <svg width="12" height="12" viewBox="0 0 24 24">
								                	<path fill="#fd7e14" fill-rule="evenodd" d="M8.5 18.5l6-6.5-6-6.5L10 4l7.5 8-7.5 8z" />
								                </svg>
							                </span>
						                </div>
					                </a>
			
					                <div><hr class="header-mynemo-logout-hr">
						                <div color="#1b1c1d" class="header-mynemo-logout-div">
							                <a href="/user/logout" class="header-mynemo-logout-span" style="text-decoration:none;">
							                	로그아웃
							                </a>
						                </div>
					                </div>
				                </div>
			                </div>
			                
			            </div>
			       
			        </div>
			        </c:if>
			        
                   </div>
               </div>
           </nav>	
	<!---------- Header End ---------->
	
	
	<div class="paymentHistoryList">
		<div class="paymentHistory-title-div">
			<div class="paymentHistory-title-title">
				<div class="title-same">
					<a class="title-a-same" href="/user/mypageUser">
						마이페이지
					</a>
					<!-- <img src="/images/ic-chevron-gray.png" class=""> -->
				</div>
				<img src="/resources/image/gon/ic-chevron-gray.png" class="Breadcrumb__Chevron-sc-11iquk8-3 jJaXkP" style="width:12px; height:12px; vertical-align: middle;">
				<div disabled="" class="title-same title-noSame">
					<a class="title-a-same" href="/purchase/getPaymentHistoryList">
						구매 내역
					</a>
				</div>
			</div>
			<div class="paymentHistory-title-content" style="margin-top: 12px;">
				<div class="title-content-div">
					<span class="title-content-spanOne">
						주문 및 배송
					</span>
					<span class="title-content-spanTwo">
						${purchaseMap.totalCount} 개
					</span>
				</div>
			</div>
		</div>
		<div class="history-blank-div"></div>
		
		<c:if test="${purchaseMap.totalCount} == 0">
		<div class="noBuyClass-div">
		<img src="/resources/image/gon/empty-pay.png" class="noBuyImage">
		<span class="noBuyClass-span">
		아직 구매하신 클래스가 없어요
		</span>
		</div>
		</c:if>
		
		<div class="row">
		<c:set var="i" value="0" />
		<c:forEach var="purchase" items="${purchaseMap.purchaseList}">
		<c:set var="i" value="${i+1}" />
		
			<div class="paymentHistory-content-div">
				<section class="history-content-section">
					
					<div class="history-content-top-title">
						<div class="history-content-top-title-one test">
							${fn:substring( purchase.purchaseDate,0,4 ) }.${fn:substring( purchase.purchaseDate,5,7 ) }.${fn:substring( purchase.purchaseDate,8,10 ) }
						</div>
						<input type="hidden" name="purchaseId" value="${purchase.purchaseId}">
						<button class="history-content-top-title-button">				
							주문상세보기						
							<svg width="16" height="16" viewBox="0 0 24 16"><path fill="#fd7e14" fill-rule="evenodd" d="M8.5 18.5l6-6.5-6-6.5L10 4l7.5 8-7.5 8z"></path></svg>	
						</button>
					</div>
					<div class="history-content-blank-div"></div>
					<div>
					<div class="history-content-section-top">
						<div class="history-content-section-in">
							<h4 class="history-content-title-h4">
							<c:if test="${purchase.purchaseState == '0' || purchase.purchaseState == '1' || purchase.purchaseState == '2'}">						
							결제 성공
							</c:if>	
							<c:if test="${purchase.purchaseState == '3'}">
							<div class="history-content-kit-title-h4">
								주문 취소 대기 중입니다.
							</div>
							</c:if>
							<c:if test="${purchase.purchaseState == '4'}">
							취소 성공
							</c:if>											
							</h4>
						</div>
						<div class="history-content-div-out">
							<div class="history-content-div-in-image">
								<img class="history-content-div-in-image" alt="" src="/images/hobbyclass/${purchase.hobbyClass.hobbyClassImage}">
							</div>
							<div class="history-content-div-in-content">
								<div class="history-content-div-in-content-title">
									${purchase.hobbyClass.hobbyClassName}
								</div>
								<div class="history-content-div-in-content-content">
									15주 수강권
								</div>
							</div>
						</div>
					</div>
					<c:if test="${purchase.purchaseState == '1' || purchase.purchaseState == '2'}">
					<button data-test-id="payment-method-CARD" type="button" class="history-content-button gph-alsb" style="margin-bottom:16px;">
						<div class="history-content-button-text">
						바로 수강하기
						<input type="hidden" name="history-list-hobbyClassNo-val" value="${purchase.hobbyClass.hobbyClassNo}">
						</div>
					</button>
					</c:if>
					</div>
					<div class="history-content-blank-div"></div>
					
					<c:if test="${purchase.componentOption == '1'}">
					<div class="history-content-section-top">
						<div class="history-content-section-in">
							<h4 class="history-content-kit-title-h4">
								<c:if test="${purchase.purchaseState == '1'}">
								상품이 배송 중입니다.
								</c:if>
								<c:if test="${purchase.purchaseState == '2'}">
								<h4 class="history-content-title-h4">
									배송 완료
								</h4>
								
								</c:if>
							</h4>
						</div>
						<div class="history-content-div-out">
							<div class="history-content-div-kit-image">
								<img class="history-content-div-kit-image" alt="" src="/images/hobbyclass/${purchase.hobbyClass.kitImage}">
							</div>
							<div class="history-content-div-in-content">
								<div class="history-content-div-in-content-title">
									${purchase.hobbyClass.kitName}
								</div>
							</div>
						</div>
					</div>
					<c:if test="${purchase.purchaseState == '1' || purchase.purchaseState == '2'}">
					<button type="button" class="history-content-button">
						<div class="history-content-button-text">
						배송 조회
						</div>
					</button>
					</c:if>
					</c:if>
					
				</section>
			
			
			</div>
				
		</c:forEach>
		</div>
	</div>
		
		
		
		<div class="history-blank-line-div"></div>

			<div class="detailPaymentHistory" style="display: none">
			<!-- 주문 상세 내역 -->
			<div class="paymentHistory-title-div">
			<div class="paymentHistory-title-title">
				<div class="title-same">
					<a class="title-a-same" href="/user/mypageUser">
						마이페이지
					</a>
					<!-- <img src="/images/ic-chevron-gray.png" class=""> -->
				</div>
				<img src="/resources/image/gon/ic-chevron-gray.png" class="Breadcrumb__Chevron-sc-11iquk8-3 jJaXkP" style="width:12px; height:12px; vertical-align: middle;">
				<div disabled="" class="title-same title-noSame">
					<a class="title-a-same" href="/purchase/getPaymentHistoryList">
						구매 내역
					</a>
				</div>
				<img src="/resources/image/gon/ic-chevron-gray.png" class="Breadcrumb__Chevron-sc-11iquk8-3 jJaXkP" style="width:12px; height:12px; vertical-align: middle;">
				<div disabled="" class="title-same title-noSame">
					<a class="title-a-same" href="#">
						구매 상세
					</a>
				</div>
			</div>
			<div class="paymentHistory-title-content" style="margin-top: 12px;">
				<div class="title-content-div">
					<span class="title-content-spanOne history-purchaseDate">
						
					</span>
					<span class="title-content-spanOne" style="margin-left: 8px;">
						주문 상세 내역
					</span>
				</div>
			</div>
		</div>
		<div class="history-blank-div"></div>
		
		<section class="final-price-info-section" style="padding: 24px 24px 0px 24px;">
						<div class="price-info-out-div">
							<div class="price-info-in-div">
								<h4 class="info-title-h4 history-purchaseState">
									
								</h4>
							</div>
						</div>
						<table class="final-price-info-table">
						<tbody>
							<tr>
								<th style="width:100px;">
									결제 수단
								</th>
								<td class="payment-totalPrice" style="text-align: left;">
									<b class="history-payMethod"></b>
								</td>
							</tr>
							<tr><th></th></tr>
							<tr><th></th></tr>
							<tr><th></th></tr>
							<tr>
								<th>
									총 상품 금액
								</th>
								<td class="payment-totalPrice history-totalPrice">
									
								</td>
							</tr>
							<tr>
								<th>
									상품 할인 금액
								</th>
								<td class="history-salePrice">
									
								</td>
							</tr>
							<tr>
								<th>
									배송료
								</th>
								<td class="paymentSalePrice">
									0원
								</td>
							</tr>
							<tr><th></th></tr>
							<tr><th></th></tr>
							<tr><th></th></tr>
							<tr><th></th></tr>
						</tbody>
						<tfoot>
							<tr >
								<th class="final-price-out-th">
								<div class="final-price-in-div">
									<strong>
										총 결제 금액
									</strong>
								</div>
								</th>
								<td class="final-price-in-result-td">
									<div class="final-price-in-result-div">
										<strong>
											<span class="paymentTotalPrice history-finalPrice">
												
											</span>
										</strong>
									</div>
								</td>
							</tr>
						</tfoot>
						</table>
						<div class="final-price-blank-div"></div>
					</section>
					
					<section class="final-price-info-section history-dlvy-section" style="padding: 24px 24px 0px 24px;">
						<div class="history-content-top-title">
							<div class="history-content-top-title-one">
								<h4 class="info-title-h4">
									배송 정보
								</h4>
							</div>
						</div>
						<table class="final-price-info-table">
						<tbody>
							<tr>
								<th style="width:96px;">
									받는 분
								</th>
								<td class="payment-totalPrice text-left history-receiverName">
									
								</td>
							</tr>
							<tr>
								<th>
									연락처
								</th>
								<td class=" text-left history-receiverPhone">
									
								</td>
							</tr>
							<tr>
								<th>
									배송 주소
								</th>
								<td class="paymentSalePrice text-left history-dlvyAddress">
									
								</td>
							</tr>
							<tr>
								<th>
									배송 요청사항
								</th>
								<td class="paymentSalePrice text-left history-dlvyRequest">
									
								</td>
							</tr>
							
						</tbody>
						</table>
						<div class="final-price-blank-div"></div>
					</section>
					
					
			<section class="history-content-section">
			
				<div class="history-content-blank-div"></div>
				<div>
				<div class="history-content-section-top">
					<div class="history-content-section-in">
						<h4 class="info-title-h4">
							구매 물품
						</h4>		
					</div>
					<div class="history-content-div-out">
						<div class="history-content-div-in-image">
							<img class="history-content-div-in-image history-hobbyClassImage" alt="" src="/images/hobbyclass/${purchase.hobbyClass.hobbyClassImage}">
						</div>
						<div class="history-content-div-in-content">
							<div class="history-content-div-in-content-title history-hobbyClassName">
								
							</div>
							<div class="history-content-div-in-content-content">
								15주 수강권
							</div>
						</div>
					</div>
				</div>
				<input type="hidden" name="history-hobbyClassNo" value="">
				<input type="hidden" name="history-lessonNo" value="">
				<button data-test-id="payment-method-CARD" type="button" class="history-content-button history-lesson-button" style="margin-bottom:16px;">
					<div class="history-content-button-text">
					바로 수강하기
					</div>
				</button>
				</div>
				<div class="history-content-blank-div"></div>
				
				<div class="history-content-section-top history-kit-div">
					<div class="history-content-section-in">
						<h4 class="history-content-kit-title-h4 history-dlvy-state">
							
						</h4>
					</div>
					<div class="history-content-div-out">
						<div class="history-content-div-kit-image">
							<img class="history-content-div-kit-image history-kitImage" alt="" src="/images/hobbyclass/${purchase.hobbyClass.kitImage}">
						</div>
						<div class="history-content-div-in-content">
							<div class="history-content-div-in-content-title history-kitName">
								
							</div>
						</div>
					</div>
				</div>
				<button type="button" class="history-content-button-buy history-getdlvy-button">
					<div class="history-content-button-buy-text">
					배송 조회
					</div>
				</button>
				<input type="hidden" name="history-purchaseId" value=""> 
				<input type="hidden" name="history-purchasePrice" value=""> 
				<button type="button" class="history-content-button history-refund-button" style="margin-top:32px;">
					<div class="history-content-button-text">
					주문 취소하기
					</div>
				</button>
				
			</section>
			</div>		
					
	<footer>
	<input type="hidden" name="role" value="${sessionScope.user.role}">
	<div class="sc-eerKOB zImje Footer__FooterContainer-lv6cz2-3 eHZNoL">
		<div class="sc-eerKOB inUTcF Footer__StyledGrid-lv6cz2-2 cPBtQc">
			<div class="sc-eilVRo QtLBl">
				<div class="sc-gHboQg bXMAOt">
					<div class="Footer__MenuContainer-lv6cz2-1 ekuQEe">
					<div color="#FFF" font-weight="bold" class="sc-bdVaJa fORXCH Footer__Title-lv6cz2-4 lhJaDk">(주)GET취미
					</div>						
						<a class="Footer__LinkContainer-lv6cz2-7 hGKcXL" href="/index.jsp">
					<div class="sc-bdVaJa hBKkTB Footer__LinkTitle-lv6cz2-9 liAQRm">홈</div>
					</a>
					<a href="https://101.gg/recruit-07" target="_blank" rel="noopener noreferrer" class="Footer__ExternalLink-lv6cz2-8 etHvQm">
						<div class="sc-bdVaJa hBKkTB Footer__LinkTitle-lv6cz2-9 liAQRm">채용
						</div>
					</a>
						<c:if test="${!empty sessionScope.user.role && sessionScope.user.role != '2'}">
						<div id="modalready" class="sc-bdVaJa hBKkTB Footer__LinkTitle-lv6cz2-9 liAQRm" style="padding-top: 10px;cursor: pointer;">회원탈퇴
						</div>	
						</c:if>
					</div>
				</div>
			<c:if test="${sessionScope.user.role eq 0 || sessionScope.user.role eq 1 || sessionScope.user.role eq 2 }">
			<div class="sc-gHboQg bXMAOt">
			<div class="Footer__MenuContainer-lv6cz2-1 ekuQEe">
			<div color="#FFF" font-weight="bold" class="sc-bdVaJa fORXCH Footer__Title-lv6cz2-4 lhJaDk">크리에이터
			</div>
			<c:if test="${sessionScope.user.role == '1' || sessionScope.user.role == '2' }">
			<a href="/user/listNotice" target="" rel="" class="Footer__ExternalLink-lv6cz2-8 etHvQm">
			<div class="sc-bdVaJa hBKkTB Footer__LinkTitle-lv6cz2-9 liAQRm">공지사항
			</div>
			</a>
			</c:if>
			<c:if test="${sessionScope.user.role == '0'}">
			<a class="Footer__LinkContainer-lv6cz2-7 hGKcXL" href="/user/changeUserCreator">
			<div class="sc-bdVaJa hBKkTB Footer__LinkTitle-lv6cz2-9 liAQRm">지원하기
			</div>
			</a>
			</c:if>
			<c:if test="${sessionScope.user.role == '1'}">
			<a class="Footer__LinkContainer-lv6cz2-7 hGKcXL" href="/creators">
			<div class="sc-bdVaJa hBKkTB Footer__LinkTitle-lv6cz2-9 liAQRm">크리에이터 센터
			</div>
			</a>
			</c:if>					
			</div>
			</div>
			</c:if>
			<div class="sc-gHboQg bXMAOt" style="margin-top: 23px;">
			<div class="Footer__FlexContainer-lv6cz2-0 htmEMd">
				<div color="#FFF" font-weight="bold" class="sc-bdVaJa fORXCH Footer__Title-lv6cz2-4 lhJaDk">고객센터
				</div>
			</div>
				<div class="sc-bdVaJa dVjooD Footer__Description-lv6cz2-5 enPSFa">오전 9시 30분 ~ 오후 6시 (주말, 공휴일 제외)
				</div>
				
			</div>
						
			</div>
		<div class="Footer__InfoContainer-lv6cz2-10 jmEzjg" style="width:100%;">
		<div class="sc-eilVRo QtLBl" style="width:100%;">		
		<div class="sc-gHboQg gPalxu" style="width:100%;">
		<div class="sc-fcdeBU hMCBZf" style="width:100%;">
		<div class="sc-bdVaJa dVjooD Footer__Description-lv6cz2-5 iIxncl" style="width: 100%;">(주)GET취미 | 대표 감자면 | 개인정보보호 책임자 감자면 | 서울 강남구 테헤란로5길 11 YBM빌딩 2층 | 사업자등록번호 : 000-55-88771 | (주)GET취미는 상품,거래정보 및 거래에 대하여 책임을 지지 않습니다.
		</div>
		</div>
		</div>
		</div>
		</div>			
		</div>
	</div>
	<!-- Modal -->
<div class="Dialog__Overlay-r2swbb-0 hupVkE" style="display : none;">
	<div class="Dialog__DialogContainer-r2swbb-1 jOWGnl" style="display : none;">
	
	<h1 class="Dialog__DialogTitle-r2swbb-3 bfIgvr">
	<div class="Dialog__Title-r2swbb-4 buRgcP">정말 GET취미를 떠나실 건가요?
	</div>
	<div id="closebtn" class="Dialog__CloseButton-r2swbb-2 hwZSXH">
		<svg  width="24" height="24" viewBox="0 0 24 24">
		<defs>
		<path id="close_svg__a" d="M17.59 5L12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12 19 6.41z"></path>
		</defs>
		<use fill="#a8aeb3" fill-rule="evenodd" xlink:href="#close_svg__a">
		</use>
		</svg>
	</div>
	</h1>
		<form id="deleteusersend" name="deleteusersend" >
			<input type="hidden" id="userId" name="userId" value="${sessionScope.user.userId}">
			<div color="#616568" class="sc-bdVaJa bgUEhx">계정을 삭제하시면 기존 수강권, 클래스 기록 등
			</div>
			<div color="#616568" class="sc-bdVaJa bgUEhx">모든 정보가 삭제됩니다.
			</div>
			<div class="SignOutForm__SignOutBodyContainer-sc-1c94aj0-1 bhsFBo">
				<h4 class="sc-bdVaJa cZzCCw">떠나시기 전에</h4>
				<div class="SignOutForm__ReasonText-sc-1c94aj0-3 icaGGS">탈퇴사유를 선택해 주세요
				</div>
				<div class="form-group cvzQqA">
					<select id="reasonCode" class="form-control cvzQqA" name="reasonCode">
						<option  selected disabled>탈퇴 사유</option>
						<option  value="0">더 이상 사용하지 않음</option>
						<option  value="1">아이디 변경 , 재가입 하기 위함</option>
						<option  value="2">유용한 정보가 없음</option>
						<option value="3">개인정보 유출 우려</option>
					</select>
				</div>			
			</div>
			<div class="SignOutForm__SignOutFooterContainer-sc-1c94aj0-2 ldmqLR">
				<div font-weight="bold" color="#3e4042" class="sc-bdVaJa kghFfp">계정을 삭제하시겠어요?
				</div>
				<button type="button" class="sc-jTzLTM flMyeK sc-kEYyzF cLtGPj SignOutForm__StyledButton-sc-1c94aj0-6 gAbriU" color="default" fill="true">
				<span class="sc-fjdhpX kCztpU">GET취미 계속 사용하기
				</span>
				</button>
				<button type="button"  class="sc-jTzLTM flMyeK sc-kEYyzF fIJpfD SignOutForm__StyledButton-sc-1c94aj0-6 gAbriU" color="orange" fill="true">
				<span class="sc-fjdhpX kCztpU">계정 삭제하기
				</span>
				</button>
			</div>
		</form>
	</div>
</div>
	
</footer>
	
	
	</div>
	
	<script type="text/javascript">
		
	function numberFormat(inputNumber) {
		   return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	$(function(){

		$(document).on("mouseover",".history-content-button" , function(){
			$(this).css("background-color","rgb(183, 188, 191)");
		});
		$(document).on("mouseleave",".history-content-button", function(){
			$(this).css("background-color","rgb(213, 218, 221)");
		});
		$(document).on("mouseover",".history-content-button-buy", function(){
			$(this).css("background-color","rgb(253, 126, 20)");
		});
		$(document).on("mouseleave",".history-content-button-buy", function(){
			$(this).css("background-color","rgb(255, 146, 43)");
		});
		
		
		
		/////////////////////////////////////////////////////////////////////////////////
		$(document).on("click", ".history-lesson-button", function(){
			self.location = "/purchase/getLessonPage?hobbyClassNo="+$("input[name='history-hobbyClassNo']").val();
		});
		
		$(document).on("click", ".gph-alsb", function(){
			self.location = "/purchase/getLessonPage?hobbyClassNo="+$(this).find("input[name='history-list-hobbyClassNo-val']").val();
		});
		
		
		/////////////////////////////////////////////////////////////////////////////////
		
		
		$(document).on("click", ".history-refund-button", function(){
			var refundConfirm = confirm("정말로 취소하시겠습니까? 클래스 혜택을 받지 못하실 수 있습니다.");
			$.ajax (
					{
						url : "/purchase/json/requestRefund",
						method : "POST",
						data : JSON.stringify({
							purchaseId: $(this).parent().find("input[name='history-purchaseId']").val(),
							hobbyClass: {hobbyClassNo: $(this).parent().find("input[name='history-hobbyClassNo']").val()},
							purchasePrice: $(this).parent().find("input[name='history-purchasePrice']").val()
						}),
						dataType : "json" ,
    					headers : {
    						"Accept" : "application/json" ,
    						"Content-Type" : "application/json"
    					} ,
						success: function(JSONData, status){							
							alert("주문 취소 신청이 완료되었습니다.");
							$(".history-finalPrice").text( numberFormat(JSONData.purchasePrice)+"원" );
							$(".history-purchaseState").html('<div class="history-content-kit-title-h4">주문 취소 대기 중입니다.</div>');
							$(".history-lesson-button").css("display","none");
							$(".history-refund-button").css("display","none");
							$(".history-getdlvy-button").css("display","none");
							$(".history-dlvy-state").text("반품이 완료되었습니다.");
							
						}
			
			});
		});
		
		$(document).on("click",".history-content-top-title-button", function(){
			$.ajax (
					{
						url : "/purchase/json/getPaymentHistory",
						method : "POST",
						data : JSON.stringify({
							purchaseId: $(this).parent().find("input[name='purchaseId']").val()
						}),
						dataType : "json" ,
    					headers : {
    						"Accept" : "application/json" ,
    						"Content-Type" : "application/json"
    					} ,
						success: function(JSONData){
							// Display Navigation
							$(".detailPaymentHistory").css("display","block");
							$(".paymentHistoryList").css("display","none");
							if( JSONData.componentOption == '0'){
								$(".history-dlvy-section").css("display","none");
								$(".history-kit-div").css("display","none");
								$(".history-getdlvy-button").css("display","none");
								$(".history-refund-button").css("display","none");
								
							}else if( JSONData.componentOption == '1'){
								$(".history-dlvy-section").css("display","block");
								$(".history-kit-div").css("display","block");
								$(".history-getdlvy-button").css("display","block");
								$(".history-refund-button").css("display","block");
							}
							if( JSONData.purchaseState == '0' ){
								$(".history-purchaseState").text("결제 성공");
								$(".history-lesson-button").css("display","none");
								$(".history-refund-button").css("display","block");
								$(".history-getdlvy-button").css("display","none");
								if( JSONData.componentOption == '1'){
									$(".history-dlvy-state").text("상품이 배송 준비 중입니다.");
								}
							}else if( JSONData.purchaseState == '1' ){
								if( JSONData.componentOption == '1'){
									$(".history-refund-button").css("display","block");
									$(".history-dlvy-state").text("상품이 배송 중입니다.");
								}else if( JSONData.componentOption == '0' ){
									$(".history-lesson-button").css("display","block");
								}
							}else if( JSONData.purchaseState == '2' ){
								if( JSONData.componentOption == '1'){
									$(".history-refund-button").css("display","block");
									$(".history-dlvy-state").html('<h4 style="color:black; margin:0px;">배송 완료</h4>'); ////
								}else if( JSONData.componentOption == '0' ){
									$(".history-lesson-button").css("display","block");
								}
							}else if( JSONData.purchaseState == '3' ){
								$(".history-purchaseState").html('<div class="history-content-kit-title-h4">주문 취소 대기 중입니다.</div>');
								$(".history-lesson-button").css("display","none");
								$(".history-refund-button").css("display","none");
								$(".history-getdlvy-button").css("display","none");
								if( JSONData.componentOption == '1'){
									$(".history-dlvy-state").text("반품이 완료되었습니다.");
								}
							}else if( JSONData.purchaseState == '4' ){
								$(".history-purchaseState").text("취소 성공");
								$(".history-lesson-button").css("display","none");
								$(".history-refund-button").css("display","none");
								$(".history-getdlvy-button").css("display","none");
								if( JSONData.componentOption == '1'){
									$(".history-dlvy-state").text("반품이 완료되었습니다.");
								}
							}
							
							// Data
							var payMethod;
							if ( JSONData.payMethod == 0){
								payMethod = '카드';
							}else if( JSONData.payMethod == 1){
								payMethod = '휴대폰'
							}							
							var purchaseDate = JSONData.purchaseDate.substring(0,4) + "."
							+ JSONData.purchaseDate.substring(5,7) + "."
							+ JSONData.purchaseDate.substring(8,10);
							var totalPrice;
							if( JSONData.componentOption == '0' ){
								totalPrice = JSONData.hobbyClass.hobbyClassPrice;
							}else if( JSONData.componentOption == '1' ){
								totalPrice = JSONData.hobbyClass.hobbyClassPrice + JSONData.hobbyClass.kitPrice;
							}
							var salePrice = totalPrice - JSONData.purchasePrice;
							var finalPrice = totalPrice - salePrice;
							$(".history-payMethod").text(payMethod);
							$(".history-purchaseDate").text(purchaseDate);
							$(".history-totalPrice").text( numberFormat(totalPrice)+"원" );
							$(".history-salePrice").text( numberFormat(salePrice)+"원" );
							$(".history-finalPrice").text( numberFormat(finalPrice)+"원" );
							$(".history-receiverName").text(JSONData.receiverName);
							$(".history-receiverPhone").text(JSONData.receiverPhone);
							$(".history-dlvyAddress").text( JSONData.dlvyAddr+" "+JSONData.dlvyDetailAddr);
							$(".history-dlvyRequest").text(JSONData.dlvyRequest);
							$(".history-hobbyClassName").text(JSONData.hobbyClass.hobbyClassName);
							$(".history-kitName").text(JSONData.hobbyClass.kitName);
							$(".history-hobbyClassImage").attr("src","/images/hobbyclass/"+JSONData.hobbyClass.hobbyClassImage);
							$(".history-kitImage").attr("src","/images/hobbyclass/"+JSONData.hobbyClass.kitImage);
							$("input[name='history-purchaseId']").val(JSONData.purchaseId);
							$("input[name='history-purchasePrice']").val(JSONData.purchasePrice);
							$("input[name='history-hobbyClassNo']").val(JSONData.hobbyClass.hobbyClassNo);
							$("input[name='history-lessonNo']").val(JSONData.lesson.lessonNo);
							
						}
				})//end of ajax
			
		});

	});	
//////////////////////////////////////////////////////////////////무한스크롤 기능 //////////////////////////////////////////////////////////////////
	$(function(){
		var bool = true;
		var currentPage = 2;
		$(window).scroll(function(){
			var window = $(this);
            var scrollTop = $(window).scrollTop();
            var windowHeight = $(window).height();
            var documentHeight = $(document).height();            
            
            if(bool){          	
	            if( scrollTop + windowHeight + 300 > documentHeight ){
	            	bool = false;
	            	//쓰로틀링 설정
	            	var timeout = setTimeout(function(){
	            		bool = true;
	            		
	            		
	            	},1000);//end of setTimeout

	            	//쓰로틀링 종료
	            	if( $("#maxPage").val() == currentPage ){
	            		clearTimeout(timeout);
	            	}//end of clearTimeout
	            	
	            		$.ajax(
	            				{
	            					url : "/purchase/json/getPaymentHistoryList" ,
	            					method : "POST" ,
	            					data : JSON.stringify({
	            						currentPage : currentPage
	            					}) ,
	            					dataType : "json" ,
	            					headers : {
	            						"Accept" : "application/json" ,
	            						"Content-Type" : "application/json"
	            					} ,
	            					success : function(JSONData , status){
										var displayValue = "";
										for(var i=0; i<JSONData.purchaseList.length; i++){				
											var purchaseDate = JSONData.purchaseList[i].purchaseDate.substring(0,4) + "."
														+ JSONData.purchaseList[i].purchaseDate.substring(5,7) + "."
														+ JSONData.purchaseList[i].purchaseDate.substring(8,10);
											var displayHtml = '<div class="paymentHistory-content-div">'
																+'<section class="history-content-section">'
																+'<div class="history-content-top-title">'
																+'<div class="history-content-top-title-one test">'
																+purchaseDate
																+'</div>'
																+'<input type="hidden" name="purchaseId" value="'+JSONData.purchaseList[i].purchaseId+'">'
																+'<button class="history-content-top-title-button">'
																+'주문상세보기'
																+'<svg width="16" height="16" viewBox="0 0 24 16">'
																+'<path fill="#fd7e14" fill-rule="evenodd" d="M8.5 18.5l6-6.5-6-6.5L10 4l7.5 8-7.5 8z">'
																+'</path></svg></button></div>'
																+'<div class="history-content-blank-div"></div><div>'
																+'<div class="history-content-section-top">'
																+'<div class="history-content-section-in">'
																+'<h4 class="history-content-title-h4">';
											
																if( JSONData.purchaseList[i].purchaseState == 0 || 
																		JSONData.purchaseList[i].purchaseState == 1 ||
																		JSONData.purchaseList[i].purchaseState == 2 ){
																	displayHtml +='결제 성공';
																}else if( JSONData.purchaseList.purchaseState == 3 ){
																	displayHtml +='<div class="history-content-kit-title-h4">주문 취소 대기 중입니다.</div>';
																}else if( JSONData.purchaseList[i].purchaseState == 4 ){
																	displayHtml +='취소 성공';
																}
												displayHtml +=				
																'</h4>'
																+'</div>'
																+'<div class="history-content-div-out">'
																+'<div class="history-content-div-in-image">'
																+'<img class="history-content-div-in-image" alt="" src="/images/hobbyclass/'+JSONData.purchaseList[i].hobbyClass.hobbyClassImage+'">'
																+'</div>'
																+'<div class="history-content-div-in-content">'
																+'<div class="history-content-div-in-content-title">'
																+JSONData.purchaseList[i].hobbyClass.hobbyClassName
																+'</div>'
																+'<div class="history-content-div-in-content-content">'
																+'15주 수강권'
																+'</div>'
																+'</div>'
																+'</div>'
																+'</div>';
																if( JSONData.purchaseList[i].purchaseState == '1' || 
																		JSONData.purchaseList[i].purchaseState == '2' ){
																	displayHtml +='<button data-test-id="payment-method-CARD" type="button" class="history-content-button" style="margin-bottom:16px;">';
																	displayHtml +='<div class="history-content-button-text">';
																	displayHtml +='바로 수강하기';
																	displayHtml +='</div>';
																	displayHtml +='</button>';
																}
												displayHtml +=	
																'</div>'
																+'<div class="history-content-blank-div"></div>';
																if( JSONData.purchaseList[i].componentOption == '1' ){
																	displayHtml +='<div class="history-content-section-top">';
																	displayHtml +='<div class="history-content-section-in">';
																	displayHtml +='<h4 class="history-content-kit-title-h4">';
																	if( JSONData.purchaseList[i].purchaseState == '1' ){
																		displayHtml +='상품이 배송 중입니다.';
																	}else if( JSONData.purchaseList[i].purchaseState == '2' ){
																		displayHtml +='<div class="history-content-title-h4">';
																		displayHtml +='배송 완료';
																		displayHtml +='</div>';
																	}
												displayHtml +=				
																	'</h4>'
																	+'</div>'
																	+'<div class="history-content-div-out">'
																	+'<div class="history-content-div-kit-image">'
																	+'<img class="history-content-div-kit-image" alt="" src="/images/hobbyclass/'+JSONData.purchaseList[i].hobbyClass.kitImage+'">'
																	+'</div>'
																	+'<div class="history-content-div-in-content">'
																	+'<div class="history-content-div-in-content-title">'
																	+JSONData.purchaseList[i].hobbyClass.kitName
																	+'</div>'
																	+'</div>'
																	+'</div>'
																	+'</div>';
																	if( JSONData.purchaseList[i].purchaseState == '1' ||
																			JSONData.purchaseList[i].purchaseState == '2' ){
																		displayHtml +='<button type="button" class="history-content-button">';
																		displayHtml +='<div class="history-content-button-text">';
																		displayHtml +='배송 조회';
																		displayHtml +='</div>';
																		displayHtml +='</button>';
																	}
																}
													displayHtml +=		
																'</section>'
																+'</div>';
																
											displayValue += displayHtml;
											
										}										
										$(".row").append(displayValue);
										currentPage ++;
	            					}//end of Call Back Function
	            				})//end of ajax
	            	
	            } 
            }
            
        });//end of scroll
	//////////////////////////////////////////////////////////////////무한스크롤 기능 //////////////////////////////////////////////////////////////////
	
		////////////////////모달///////
		
		$("#closebtn").on("click",function(){	
			window.open('/', '_self', '');
			window.close();
		});
		 $("#modalready").on("click",function(){			
			$(".Dialog__Overlay-r2swbb-0.hupVkE").attr("style","block");
			$(".Dialog__DialogContainer-r2swbb-1.jOWGnl").attr("style","block");
		}); 
		$(".sc-jTzLTM.flMyeK.sc-kEYyzF.cLtGPj.SignOutForm__StyledButton-sc-1c94aj0-6.gAbriU").on("click",function(){
			window.open('/', '_self', '');
			window.close();
		});	
		
		
		 $(".sc-jTzLTM.flMyeK.sc-kEYyzF.fIJpfD.SignOutForm__StyledButton-sc-1c94aj0-6.gAbriU").on("click",function(){
			
					
					Swal.fire({
						  title: '정말 탈퇴 하시겠습니까?',
						  icon: 'warning',
						  showCancelButton: true,
						  confirmButtonColor: '#3085d6',
						  cancelButtonColor: '#d33',
						  confirmButtonText: '네, 탈퇴 하겠습니다',
						  cancelButtonText: '아니요'
						}).then((result) => {
						  if (result.value) {
						    Swal.fire({
					    	  icon: 'success',
							  title: '회원 탈퇴 완료',
							  showConfirmButton: false,
							  timer : 800
						    }).then((result) => {
								$("#deleteusersend").attr("method","post").attr("action","/user/deleteUser").submit();
								
							})
						  }
						})
		  	
			
		});
		 
		 $(document).ready(function(){
			$(".sc-jTzLTM.flMyeK.sc-kEYyzF.fIJpfD.SignOutForm__StyledButton-sc-1c94aj0-6.gAbriU").attr("disabled",true);
			$(".sc-jTzLTM.flMyeK.sc-kEYyzF.fIJpfD.SignOutForm__StyledButton-sc-1c94aj0-6.gAbriU").addClass("nono"); 
		 });
		 $("#reasonCode").on("change",function(){			
			$(".sc-jTzLTM.flMyeK.sc-kEYyzF.fIJpfD.SignOutForm__StyledButton-sc-1c94aj0-6.gAbriU").attr("disabled",false);
			$(".sc-jTzLTM.flMyeK.sc-kEYyzF.fIJpfD.SignOutForm__StyledButton-sc-1c94aj0-6.gAbriU").removeClass("nono"); 			 
			 
		 });
		 
		 var myonoff = false;
		 $(document).on("click", ".fa-angle-down", function(){

			 if( !myonoff ){
				 $(".header-mynemo-out-div").css("display","block");
				 myonoff = true;
			 }else if( myonoff ){
				 $(".header-mynemo-out-div").css("display","none");
				 myonoff = false;
			 }
			
		 })
		 
		 
	});//end of function
	</script>
</body>
</html>