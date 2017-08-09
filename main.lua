local androidFileShare = require "plugin.androidFileShare"
local json = require("json")
local bg = display.newRect( display.contentCenterX, display.contentCenterY, display.actualContentWidth, display.actualContentHeight )
local logo = display.newText( "Android Pick File Plugin", 0, 0, native.systemFontBold, 20 )
logo.x, logo.y = display.contentCenterX, 50
bg:setFillColor( 0,0,.5 )
local widget = require("widget")
local pathToImport = system.pathForFile( "imageFromPicker.png", system.DocumentsDirectory )

local pickFile
pickFile = widget.newButton( {
	label = "Share File",
	id = "shareFile",
	labelColor = { default={ 0, 0, 1 }, over={ 0, 0, 0, 0.5 } },
	onRelease = function ( e )
		androidFileShare.show("image/*",pathToImport, function ( ev )
            if (ev.isError == false) then
                local showImage = display.newImage( "imageFromPicker.png", system.DocumentsDirectory )
                showImage:scale( .3, .3 )
                showImage.x, showImage.y = display.contentCenterX, display.contentCenterY+150
            end
        end )
	end
} )
pickFile.x, pickFile.y = display.contentCenterX, display.contentCenterY-100
