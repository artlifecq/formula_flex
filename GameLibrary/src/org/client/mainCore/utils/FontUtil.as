//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.utils
{
    import flash.text.Font;
    import flash.text.TextFormat;
    import flash.text.TextField;

    public class FontUtil 
    {

        private static var _fontName:String = "宋体";
        private static var _font:Font;


        public static function get fontName():String
        {
            return (_fontName);
        }

        public static function set fontName(font:String):void
        {
            _fontName = font;
        }

        public static function register(fontCls:Class):void
        {
            var i:int;
            var j:int;
            _font = new (fontCls)();
            Font.registerFont(fontCls);
            _fontName = _font.fontName;
            var allFonts:Array = Font.enumerateFonts(true);
            allFonts.sortOn("fontName", 1);
            i = 0;
            while (i < allFonts.length)
            {
                i++;
            };
            var embeddedFonts:Array = Font.enumerateFonts(false);
            embeddedFonts.sortOn("fontName", 1);
            j = 0;
            while (j < embeddedFonts.length)
            {
                j++;
            };
        }

        public static function setTxtFontFmt(txt:TextField, color:uint=0, size:uint=12):void
        {
            var txtFmt:TextFormat = new TextFormat();
            txtFmt.font = fontName;
            txtFmt.color = color;
            txtFmt.size = size;
            txt.defaultTextFormat = txtFmt;
        }


    }
}//package org.client.mainCore.utils
