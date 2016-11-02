//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.utils
{
    import flash.utils.ByteArray;

    public class ImageInfo 
    {

        private const FILE_TYPES:Array = ["JPEG", "GIF", "PNG"];
        private const MIME_TYPES:Array = ["image/jpeg", "image/gif", "image/png"];
        private const FORMAT_JPEG:int = 0;
        private const FORMAT_GIF:int = 1;
        private const FORMAT_PNG:int = 2;

        private var _stream:ByteArray;
        private var _width:int;
        private var _height:int;
        private var _bitsPerPixel:int;
        private var _progressive:Boolean;
        private var _physicalWidth:String;
        private var _physicalHeight:String;
        private var _physicalHeightDpi:int;
        private var _physicalWidthDpi:int;
        private var _fileType:String;
        private var _mimeType:String;
        private var _format:int;

        public function ImageInfo():void
        {
        }

        public function checkType(bytes:ByteArray):Boolean
        {
            _stream = bytes;
            var b1 = (read() & 0xFF);
            var b2 = (read() & 0xFF);
            if ((((b1 == 71)) && ((b2 == 73))))
            {
                return (checkGif());
            };
            if ((((b1 == 0xFF)) && ((b2 == 216))))
            {
                return (checkJPG());
            };
            if ((((b1 == 137)) && ((b2 == 80))))
            {
                return (checkPng());
            };
            return (false);
        }

        private function checkGif():Boolean
        {
            var GIF_MAGIC_87A:ByteArray = new ByteArray();
            GIF_MAGIC_87A.writeByte(70);
            GIF_MAGIC_87A.writeByte(56);
            GIF_MAGIC_87A.writeByte(55);
            GIF_MAGIC_87A.writeByte(97);
            var GIF_MAGIC_89A:ByteArray = new ByteArray();
            GIF_MAGIC_89A.writeByte(70);
            GIF_MAGIC_89A.writeByte(56);
            GIF_MAGIC_89A.writeByte(57);
            GIF_MAGIC_89A.writeByte(97);
            var a:ByteArray = new ByteArray();
            if (read(a, 0, 11) != 11)
            {
                return (false);
            };
            if (((!(equals(a, 0, GIF_MAGIC_89A, 0, 4))) && (!(equals(a, 0, GIF_MAGIC_87A, 0, 4)))))
            {
                return (false);
            };
            _format = 1;
            _width = getShortLittleEndian(a, 4);
            _height = getShortLittleEndian(a, 6);
            var flags = (a[8] & 0xFF);
            _bitsPerPixel = (((flags >> 4) & 7) + 1);
            _progressive = !(((flags & 2) == 0));
            return (true);
        }

        private function checkPng():Boolean
        {
            var PNG_MAGIC:ByteArray = new ByteArray();
            PNG_MAGIC.writeByte(78);
            PNG_MAGIC.writeByte(71);
            PNG_MAGIC.writeByte(13);
            PNG_MAGIC.writeByte(10);
            PNG_MAGIC.writeByte(26);
            PNG_MAGIC.writeByte(10);
            var a:ByteArray = new ByteArray();
            if (read(a, 0, 27) != 27)
            {
                return (false);
            };
            if (!equals(a, 0, PNG_MAGIC, 0, 6))
            {
                return (false);
            };
            _format = 2;
            _width = getIntBigEndian(a, 14);
            _height = getIntBigEndian(a, 18);
            _bitsPerPixel = a[22];
            var colorType:int = a[23];
            if ((((colorType == 2)) || ((colorType == 6))))
            {
                _bitsPerPixel = (_bitsPerPixel * 3);
            };
            _progressive = !((a[26] == 0));
            return (true);
        }

        private function checkJPG():Boolean
        {
            var marker:Number;
            var size:Number;
            var x:int;
            var y:int;
            var horzPixelsPerCM:Number;
            var vertPixelsPerCM:Number;
            var APP0_ID:ByteArray = new ByteArray();
            APP0_ID.writeByte(74);
            APP0_ID.writeByte(70);
            APP0_ID.writeByte(73);
            APP0_ID.writeByte(70);
            APP0_ID.writeByte(0);
            var data:ByteArray = new ByteArray();
            while (true)
            {
                if (read(data, 0, 4) != 4)
                {
                    return (false);
                };
                marker = getShortBigEndian(data, 0);
                size = getShortBigEndian(data, 2);
                if ((marker & 0xFF00) != 0xFF00)
                {
                    return (false);
                };
                if ((marker == 65504))
                {
                    if (size < 14)
                    {
                        skip((size - 2));
                        continue;
                    };
                    if (read(data, 0, 12) != 12)
                    {
                        return (false);
                    };
                    if (equals(APP0_ID, 0, data, 0, 5))
                    {
                        if ((data[7] == 1))
                        {
                            setPhysicalWidthDpi(getShortBigEndian(data, 8));
                            setPhysicalHeightDpi(getShortBigEndian(data, 10));
                        }
                        else
                        {
                            if (data[7] == 2)
                            {
                                x = getShortBigEndian(data, 8);
                                y = getShortBigEndian(data, 10);
                                setPhysicalWidthDpi((x * 2.54));
                                setPhysicalHeightDpi((y * 2.54));
                            };
                        };
                    };
                    skip((size - 14));
                }
                else
                {
                    if ((((((((marker >= 65472)) && ((marker <= 65487)))) && (!((marker == 65476))))) && (!((marker == 65480)))))
                    {
                        if (read(data, 0, 6) != 6)
                        {
                            return (false);
                        };
                        _format = 0;
                        _bitsPerPixel = ((data[0] & 0xFF) * (data[5] & 0xFF));
                        _progressive = (((((((marker == 65474)) || ((marker == 65478)))) || ((marker == 65482)))) || ((marker == 65486)));
                        _width = getShortBigEndian(data, 3);
                        _height = getShortBigEndian(data, 1);
                        horzPixelsPerCM = (_physicalWidthDpi / 2.54);
                        vertPixelsPerCM = (_physicalHeightDpi / 2.54);
                        _physicalWidth = (_width / horzPixelsPerCM).toFixed(2);
                        _physicalHeight = (_height / vertPixelsPerCM).toFixed(2);
                        return (true);
                    };
                    skip((size - 2));
                };
            };
            return (false); //dead code
        }

        private function getShortBigEndian(ba:ByteArray, offset:int):Number
        {
            return (((ba[offset] << 8) | ba[(offset + 1)]));
        }

        private function getShortLittleEndian(ba:ByteArray, offset:int):int
        {
            return ((ba[offset] | (ba[(offset + 1)] << 8)));
        }

        private function getIntBigEndian(ba:ByteArray, offset:int):int
        {
            return (((((ba[offset] << 24) | (ba[(offset + 1)] << 16)) | (ba[(offset + 2)] << 8)) | ba[(offset + 3)]));
        }

        private function skip(numBytes:int):void
        {
            _stream.position = (_stream.position + numBytes);
        }

        private function equals(ba1:ByteArray, offs1:int, ba2:ByteArray, offs2:int, num:int):Boolean
        {
            while (num-- > 0)
            {
                if (ba1[offs1++] != ba2[offs2++])
                {
                    return (false);
                };
            };
            return (true);
        }

        private function read(... args):int
        {
            switch (args.length)
            {
                case 0:
                    return (_stream.readByte());
                case 1:
                    _stream.readBytes(args[0]);
                    return (args[0].length);
                case 3:
                    _stream.readBytes(args[0], args[1], args[2]);
                    return (args[2]);
                default:
                    throw (new ArgumentError(("Argument Error at ImageInfo.read(). Expected 0, 1, or 3. Received " + args.length)));
                    return; //dead code
            };
        }

        private function setPhysicalHeightDpi(newValue:int):void
        {
            _physicalWidthDpi = newValue;
        }

        private function setPhysicalWidthDpi(newValue:int):void
        {
            _physicalHeightDpi = newValue;
        }

        public function get physicalHeightDpi():int
        {
            return (_physicalHeightDpi);
        }

        public function get physicalWidthDpi():int
        {
            return (_physicalWidthDpi);
        }

        public function get bitsPerPixel():int
        {
            return (_bitsPerPixel);
        }

        public function get height():int
        {
            return (_height);
        }

        public function get width():int
        {
            return (_width);
        }

        public function get progressive():Boolean
        {
            return (_progressive);
        }

        public function get fileType():String
        {
            return (FILE_TYPES[_format]);
        }

        public function get mimeType():String
        {
            return (MIME_TYPES[_format]);
        }

        public function get physicalWidth():String
        {
            return (_physicalWidth);
        }

        public function get physicalHeight():String
        {
            return (_physicalHeight);
        }


    }
}//package org.client.mainCore.utils
