*** Settings ***
Resource  ./PO/CyberCodersLanding.robot
Resource  ./PO/CyberCodersResults1.robot
Resource  ./PO/RandstradLanding.robot


*** Variables ***


*** Keywords ***


Open CyberCoders
    CyberCodersLanding.Load Landing Page
    CyberCodersLanding.Verify Page Loaded
    CyberCodersLanding.Search For Job

Read Cybercoders
    CyberCodersResults1.Verify Page Loaded
    CyberCodersResults1.Get Data


Open Randstrad
    RandstradLanding.Load Landing Page
    RandstradLanding.Verify Page Loaded
    RandstradLanding.Search For Job

Debug log to Excel
    CyberCodersResults1.Debug Just log results