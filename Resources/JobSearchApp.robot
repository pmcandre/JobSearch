*** Settings ***
Resource  ./PO/CyberCodersLanding.robot
Resource  ./PO/RandstradLanding.robot


*** Variables ***


*** Keywords ***


Open CyberCoders
    CyberCodersLanding.Load Landing Page
    CyberCodersLanding.Verify Page Loaded
    CyberCodersLanding.Search For Job

Open Randstrad
    RandstradLanding.Load Landing Page
    RandstradLanding.Verify Page Loaded
    RandstradLanding.Search For Job
