package com.editor.data.map
{
	import com.editor.cfg.ConfigData;
	import com.editor.data.ConfigDesc;

	import flash.geom.Rectangle;
	import flash.utils.ByteArray;

	/**
	 *
	 * 客户端地图数据
	 * @author L.L.M.Sunny
	 * 创建时间：2015-7-27 下午2:03:17
	 *
	 */
	public class EditorClientMapData extends ConfigData
	{
		public static function setFieldLabelsAndTips(configDesc : ConfigDesc) : void
		{
			configDesc.fieldLabels["mapRes"] = "地图资源";
			configDesc.fieldLabels["miniMapRes"] = "小地图资源";
			configDesc.fieldLabels["radarMapRes"] = "雷达地图资源";
			configDesc.fieldLabels["bgSoundRes"] = "背景音乐资源";
			configDesc.fieldLabels["miniCorrectOffsetX"] = "横偏移";
			configDesc.fieldLabels["miniCorrectOffsetY"] = "纵偏移";
			configDesc.fieldLabels["miniCorrectScaleX"] = "横缩放";
			configDesc.fieldLabels["miniCorrectScaleY"] = "纵缩放";
			configDesc.fieldLabels["miniCorrectPan"] = "偏航角";
			configDesc.fieldLabels["miniCorrectTilt"] = "俯仰角";
			configDesc.fieldLabels["miniCorrectRoll"] = "滚转角";
		}

		public static const VERSION : int = 10;
		public static const MAP_AREA_VERSION : int = 3;
		public static const TIME_OF_THE_DAY_DATA_VERSION : int = 2;
		public static const CAMERA_PROPERTY_DATA_VERSION : int = 4;
		public static const SCALE_RATIO : int = 100;

		public var version : int = 0;
		public var mapAreaVersion : int = 0;
		public var timeOfTheDayDataVersion : int = 0;
		public var cameraPropertyDataVersion : int = 0;

		public var mapAreaCount : int = 0;
		public var areaDatas : Array = [];
		public var timeOfTheDayData : ClientMapTimeOfTheDayData;
		public var cameraPropertyData : ClientMapCameraPropertyData;

		public var boundMinX : int = 0;
		public var boundMinY : int = 0;
		public var boundMaxX : int = 0;
		public var boundMaxY : int = 0;

		public var miniMapRect : Rectangle = new Rectangle();
		public var radarMapRect : Rectangle = new Rectangle();

		public function EditorClientMapData()
		{
			super();
			this["mapRes"] = "";
			this["miniMapRes"] = "";
			this["radarMapRes"] = "";
			this["bgSoundRes"] = "";
			this["miniCorrectScaleX"] = 0;
			this["miniCorrectScaleY"] = 0;
			this["miniCorrectTilt"] = 0;
			this["miniCorrectRoll"] = 0;
			this["miniCorrectPan"] = 0;
			this["miniCorrectOffsetX"] = 0;
			this["miniCorrectOffsetY"] = 0;
		}

		public function get mMiniCorrectScaleX() : int
		{
			return this["miniCorrectScaleX"];
		}

		public function set mMiniCorrectScaleX(value : int) : void
		{
			this["miniCorrectScaleX"] = value;
		}

		public function get mMiniCorrectScaleY() : int
		{
			return this["miniCorrectScaleY"];
		}

		public function set mMiniCorrectScaleY(value : int) : void
		{
			this["miniCorrectScaleY"] = value;
		}

		public function get mMiniCorrectOffsetX() : int
		{
			return this["miniCorrectOffsetX"];
		}

		public function set mMiniCorrectOffsetX(value : int) : void
		{
			this["miniCorrectOffsetX"] = value;
		}

		public function get mMiniCorrectOffsetY() : int
		{
			return this["miniCorrectOffsetY"];
		}

		public function set mMiniCorrectOffsetY(value : int) : void
		{
			this["miniCorrectOffsetY"] = value;
		}

		public function get mMiniCorrectTilt() : int
		{
			return this["miniCorrectTilt"];
		}

		public function set mMiniCorrectTilt(value : int) : void
		{
			this["miniCorrectTilt"] = value;
		}

		public function get mMiniCorrectRoll() : int
		{
			return this["miniCorrectRoll"];
		}

		public function set mMiniCorrectRoll(value : int) : void
		{
			this["miniCorrectRoll"] = value;
		}

		public function get mMiniCorrectPan() : int
		{
			return this["miniCorrectPan"];
		}

		public function set mMiniCorrectPan(value : int) : void
		{
			this["miniCorrectPan"] = value;
		}

		public function get mMapRes() : String
		{
			return this["mapRes"];
		}

		public function set mMapRes(value : String) : void
		{
			this["mapRes"] = value;
		}

		public function get mMiniMapRes() : String
		{
			return this["miniMapRes"];
		}

		public function set mMiniMapRes(value : String) : void
		{
			this["miniMapRes"] = value;
		}

		public function get mRadarMapRes() : String
		{
			return this["radarMapRes"];
		}

		public function set mRadarMapRes(value : String) : void
		{
			this["radarMapRes"] = value;
		}

		public function get mBgSoundRes() : String
		{
			return this["bgSoundRes"];
		}

		public function set mBgSoundRes(value : String) : void
		{
			this["bgSoundRes"] = value;
		}

		public function writeTo(bytes : ByteArray) : void
		{
			bytes.writeByte(VERSION);

			bytes.writeUTF(mMapRes);
			bytes.writeUTF(mMiniMapRes);
			bytes.writeShort(miniMapRect.x);
			bytes.writeShort(miniMapRect.y);
			bytes.writeShort(miniMapRect.width);
			bytes.writeShort(miniMapRect.height);

			bytes.writeUTF(mRadarMapRes);
			bytes.writeShort(radarMapRect.x);
			bytes.writeShort(radarMapRect.y);
			bytes.writeShort(radarMapRect.width);
			bytes.writeShort(radarMapRect.height);

			bytes.writeUTF(mBgSoundRes);
			bytes.writeInt(mMiniCorrectOffsetX);
			bytes.writeInt(mMiniCorrectOffsetY);
			bytes.writeInt(mMiniCorrectScaleX);
			bytes.writeInt(mMiniCorrectScaleY);
			bytes.writeInt(mMiniCorrectTilt);
			bytes.writeInt(mMiniCorrectRoll);
			bytes.writeInt(mMiniCorrectPan);
			bytes.writeInt(boundMinX);
			bytes.writeInt(boundMinY);
			bytes.writeInt(boundMaxX);
			bytes.writeInt(boundMaxY);

			bytes.writeByte(MAP_AREA_VERSION);
			mapAreaCount = areaDatas.length;
			bytes.writeByte(mapAreaCount);
			for (var i : int = 0; i < mapAreaCount; i++)
			{
				var areaData : ClientMapAreaData = areaDatas[i];
				areaData.writeTo(bytes);
			}

			bytes.writeByte(TIME_OF_THE_DAY_DATA_VERSION);
			var hasTimeOfTheDayData : Boolean = timeOfTheDayData != null;
			bytes.writeBoolean(hasTimeOfTheDayData);
			if (timeOfTheDayData)
			{
				timeOfTheDayData.writeTo(bytes);
			}

			bytes.writeByte(CAMERA_PROPERTY_DATA_VERSION);
			var hasCameraPropertyData : Boolean = cameraPropertyData != null;
			bytes.writeBoolean(hasCameraPropertyData);
			if (cameraPropertyData)
			{
				cameraPropertyData.writeTo(bytes);
			}
		}

		public function readFrom(bytes : ByteArray) : void
		{
			version = bytes.readByte();
			var i : int;
			var areaData : ClientMapAreaData;
			var hasTimeOfTheDayData : Boolean;
			var hasCameraPropertyData : Boolean;
			if (version == 10)
			{
				mMapRes = bytes.readUTF();
				mMiniMapRes = bytes.readUTF();
				miniMapRect.x = bytes.readUnsignedShort();
				miniMapRect.y = bytes.readUnsignedShort();
				miniMapRect.width = bytes.readUnsignedShort();
				miniMapRect.height = bytes.readUnsignedShort();

				mRadarMapRes = bytes.readUTF();
				radarMapRect.x = bytes.readUnsignedShort();
				radarMapRect.y = bytes.readUnsignedShort();
				radarMapRect.width = bytes.readUnsignedShort();
				radarMapRect.height = bytes.readUnsignedShort();

				mBgSoundRes = bytes.readUTF();
				mMiniCorrectOffsetX = bytes.readInt();
				mMiniCorrectOffsetY = bytes.readInt();
				mMiniCorrectScaleX = bytes.readInt();
				mMiniCorrectScaleY = bytes.readInt();
				mMiniCorrectTilt = bytes.readInt();
				mMiniCorrectRoll = bytes.readInt();
				mMiniCorrectPan = bytes.readInt();
				boundMinX = bytes.readInt();
				boundMinY = bytes.readInt();
				boundMaxX = bytes.readInt();
				boundMaxY = bytes.readInt();

				mapAreaVersion = bytes.readByte();
				areaDatas.length = 0;
				if (bytes.bytesAvailable)
				{
					mapAreaCount = bytes.readUnsignedByte();
					for (i = 0; i < mapAreaCount; i++)
					{
						areaData = new ClientMapAreaData();
						areaData.readFrom(mapAreaVersion, bytes);
						areaDatas.push(areaData);
					}
				}

				timeOfTheDayDataVersion = bytes.readByte();
				hasTimeOfTheDayData = bytes.readBoolean();
				if (hasTimeOfTheDayData)
				{
					timeOfTheDayData = new ClientMapTimeOfTheDayData();
					timeOfTheDayData.readFrom(timeOfTheDayDataVersion, bytes);
				}
				cameraPropertyDataVersion = bytes.readByte();
				hasCameraPropertyData = bytes.readBoolean();
				if (hasCameraPropertyData)
				{
					cameraPropertyData = new ClientMapCameraPropertyData()
					cameraPropertyData.readFrom(cameraPropertyDataVersion, bytes);
				}
			}
			else if (version == 9)
			{
				mMiniMapRes = bytes.readUTF();
				miniMapRect.x = bytes.readUnsignedShort();
				miniMapRect.y = bytes.readUnsignedShort();
				miniMapRect.width = bytes.readUnsignedShort();
				miniMapRect.height = bytes.readUnsignedShort();

				mRadarMapRes = bytes.readUTF();
				radarMapRect.x = bytes.readUnsignedShort();
				radarMapRect.y = bytes.readUnsignedShort();
				radarMapRect.width = bytes.readUnsignedShort();
				radarMapRect.height = bytes.readUnsignedShort();

				mBgSoundRes = bytes.readUTF();
				mMiniCorrectOffsetX = bytes.readInt();
				mMiniCorrectOffsetY = bytes.readInt();
				mMiniCorrectScaleX = bytes.readInt();
				mMiniCorrectScaleY = bytes.readInt();
				mMiniCorrectTilt = bytes.readInt();
				mMiniCorrectRoll = bytes.readInt();
				mMiniCorrectPan = bytes.readInt();
				boundMinX = bytes.readInt();
				boundMinY = bytes.readInt();
				boundMaxX = bytes.readInt();
				boundMaxY = bytes.readInt();

				mapAreaVersion = bytes.readByte();
				areaDatas.length = 0;
				if (bytes.bytesAvailable)
				{
					mapAreaCount = bytes.readUnsignedByte();
					for (i = 0; i < mapAreaCount; i++)
					{
						areaData = new ClientMapAreaData();
						areaData.readFrom(mapAreaVersion, bytes);
						areaDatas.push(areaData);
					}
				}

				timeOfTheDayDataVersion = bytes.readByte();
				hasTimeOfTheDayData = bytes.readBoolean();
				if (hasTimeOfTheDayData)
				{
					timeOfTheDayData = new ClientMapTimeOfTheDayData();
					timeOfTheDayData.readFrom(timeOfTheDayDataVersion, bytes);
				}
				cameraPropertyDataVersion = bytes.readByte();
				hasCameraPropertyData = bytes.readBoolean();
				if (hasCameraPropertyData)
				{
					cameraPropertyData = new ClientMapCameraPropertyData()
					cameraPropertyData.readFrom(cameraPropertyDataVersion, bytes);
				}
			}
			else if (version == 8)
			{
				mMiniMapRes = bytes.readUTF();
				mRadarMapRes = bytes.readUTF();
				mBgSoundRes = bytes.readUTF();
				mMiniCorrectOffsetX = bytes.readInt();
				mMiniCorrectOffsetY = bytes.readInt();
				mMiniCorrectScaleX = bytes.readInt();
				mMiniCorrectScaleY = bytes.readInt();
				mMiniCorrectTilt = bytes.readInt();
				mMiniCorrectRoll = bytes.readInt();
				mMiniCorrectPan = bytes.readInt();
				boundMinX = bytes.readInt();
				boundMinY = bytes.readInt();
				boundMaxX = bytes.readInt();
				boundMaxY = bytes.readInt();

				mapAreaVersion = bytes.readByte();
				areaDatas.length = 0;
				if (bytes.bytesAvailable)
				{
					mapAreaCount = bytes.readUnsignedByte();
					for (i = 0; i < mapAreaCount; i++)
					{
						areaData = new ClientMapAreaData();
						areaData.readFrom(mapAreaVersion, bytes);
						areaDatas.push(areaData);
					}
				}

				timeOfTheDayDataVersion = bytes.readByte();
				hasTimeOfTheDayData = bytes.readBoolean();
				if (hasTimeOfTheDayData)
				{
					timeOfTheDayData = new ClientMapTimeOfTheDayData();
					timeOfTheDayData.readFrom(timeOfTheDayDataVersion, bytes);
				}
				cameraPropertyDataVersion = bytes.readByte();
				hasCameraPropertyData = bytes.readBoolean();
				if (hasCameraPropertyData)
				{
					cameraPropertyData = new ClientMapCameraPropertyData()
					cameraPropertyData.readFrom(cameraPropertyDataVersion, bytes);
				}
			}
			else if (version == 7)
			{
				mMiniMapRes = bytes.readUTF();
				mBgSoundRes = bytes.readUTF();
				mMiniCorrectOffsetX = bytes.readInt();
				mMiniCorrectOffsetY = bytes.readInt();
				mMiniCorrectScaleX = bytes.readInt();
				mMiniCorrectScaleY = bytes.readInt();
				mMiniCorrectTilt = bytes.readInt();
				mMiniCorrectRoll = bytes.readInt();
				mMiniCorrectPan = bytes.readInt();
				boundMinX = bytes.readInt();
				boundMinY = bytes.readInt();
				boundMaxX = bytes.readInt();
				boundMaxY = bytes.readInt();

				mapAreaVersion = bytes.readByte();
				areaDatas.length = 0;
				if (bytes.bytesAvailable)
				{
					mapAreaCount = bytes.readUnsignedByte();
					for (i = 0; i < mapAreaCount; i++)
					{
						areaData = new ClientMapAreaData();
						areaData.readFrom(mapAreaVersion, bytes);
						areaDatas.push(areaData);
					}
				}

				timeOfTheDayDataVersion = bytes.readByte();
				hasTimeOfTheDayData = bytes.readBoolean();
				if (hasTimeOfTheDayData)
				{
					timeOfTheDayData = new ClientMapTimeOfTheDayData();
					timeOfTheDayData.readFrom(timeOfTheDayDataVersion, bytes);
				}
				cameraPropertyDataVersion = bytes.readByte();
				hasCameraPropertyData = bytes.readBoolean();
				if (hasCameraPropertyData)
				{
					cameraPropertyData = new ClientMapCameraPropertyData()
					cameraPropertyData.readFrom(cameraPropertyDataVersion, bytes);
				}
			}
			else if (version == 6)
			{
				mMiniMapRes = bytes.readUTF();
				mBgSoundRes = bytes.readUTF();
				mMiniCorrectOffsetX = bytes.readInt();
				mMiniCorrectOffsetY = bytes.readInt();
				mMiniCorrectScaleX = bytes.readInt();
				mMiniCorrectScaleY = bytes.readInt();
				mMiniCorrectTilt = bytes.readInt();
				mMiniCorrectRoll = bytes.readInt();
				mMiniCorrectPan = bytes.readInt();

				mapAreaVersion = bytes.readByte();
				areaDatas.length = 0;
				if (bytes.bytesAvailable)
				{
					mapAreaCount = bytes.readUnsignedByte();
					for (i = 0; i < mapAreaCount; i++)
					{
						areaData = new ClientMapAreaData();
						areaData.readFrom(mapAreaVersion, bytes);
						areaDatas.push(areaData);
					}
				}

				timeOfTheDayDataVersion = bytes.readByte();
				hasTimeOfTheDayData = bytes.readBoolean();
				if (hasTimeOfTheDayData)
				{
					timeOfTheDayData = new ClientMapTimeOfTheDayData();
					timeOfTheDayData.readFrom(timeOfTheDayDataVersion, bytes);
				}
				cameraPropertyDataVersion = bytes.readByte();
				hasCameraPropertyData = bytes.readBoolean();
				if (hasCameraPropertyData)
				{
					cameraPropertyData = new ClientMapCameraPropertyData()
					cameraPropertyData.readFrom(cameraPropertyDataVersion, bytes);
				}
			}
			else if (version == 5)
			{
				mMiniMapRes = bytes.readUTF();
				mMiniCorrectOffsetX = bytes.readInt();
				mMiniCorrectOffsetY = bytes.readInt();
				mMiniCorrectScaleX = bytes.readInt();
				mMiniCorrectScaleY = bytes.readInt();
				mMiniCorrectTilt = bytes.readInt();
				mMiniCorrectRoll = bytes.readInt();
				mMiniCorrectPan = bytes.readInt();

				mapAreaVersion = bytes.readByte();
				areaDatas.length = 0;
				if (bytes.bytesAvailable)
				{
					mapAreaCount = bytes.readUnsignedByte();
					for (i = 0; i < mapAreaCount; i++)
					{
						areaData = new ClientMapAreaData();
						areaData.readFrom(mapAreaVersion, bytes);
						areaDatas.push(areaData);
					}
				}

				timeOfTheDayDataVersion = bytes.readByte();
				hasTimeOfTheDayData = bytes.readBoolean();
				if (hasTimeOfTheDayData)
				{
					timeOfTheDayData = new ClientMapTimeOfTheDayData();
					timeOfTheDayData.readFrom(timeOfTheDayDataVersion, bytes);
				}
			}
			else if (version == 4)
			{
				mMiniMapRes = bytes.readUTF();
				mMiniCorrectOffsetX = bytes.readInt();
				mMiniCorrectOffsetY = bytes.readInt();
				mMiniCorrectScaleX = bytes.readInt();
				mMiniCorrectScaleY = bytes.readInt();
				mMiniCorrectTilt = bytes.readInt();
				mMiniCorrectRoll = bytes.readInt();
				mMiniCorrectPan = bytes.readInt();

				mapAreaVersion = 0;
				areaDatas.length = 0;
				if (bytes.bytesAvailable)
				{
					mapAreaCount = bytes.readUnsignedByte();
					for (i = 0; i < mapAreaCount; i++)
					{
						areaData = new ClientMapAreaData();
						areaData.readFrom(mapAreaVersion, bytes);
						areaDatas.push(areaData);
					}
				}

				timeOfTheDayDataVersion = 0;
				hasTimeOfTheDayData = bytes.readBoolean();
				if (hasTimeOfTheDayData)
				{
					timeOfTheDayData = new ClientMapTimeOfTheDayData();
					timeOfTheDayData.readFrom(timeOfTheDayDataVersion, bytes);
				}
			}
		}

		public function get miniScaleX() : Number
		{
			var value : Number = (mMiniCorrectScaleX > 0 ? mMiniCorrectScaleX / SCALE_RATIO : 1);
			value = value == 0 ? 1 : value;
			return value;
		}

		public function set miniScaleX(value : Number) : void
		{
			mMiniCorrectScaleX = value * SCALE_RATIO;
		}

		public function get miniScaleY() : Number
		{
			var value : Number = (mMiniCorrectScaleY > 0 ? mMiniCorrectScaleY / SCALE_RATIO : 1);
			value = value == 0 ? 1 : value;
			return value;
		}

		public function set miniScaleY(value : Number) : void
		{
			mMiniCorrectScaleY = value * SCALE_RATIO;
		}

		public function getObstacleAreas() : Vector.<ClientMapAreaData>
		{
			var areaSet : Vector.<ClientMapAreaData> = new Vector.<ClientMapAreaData>();
			for each (var areaData : ClientMapAreaData in areaDatas)
			{
				if (areaData.mType == MapAreaTypeEnum.OBSTACLE)
					areaSet.push(areaData);
			}
			return areaSet;
		}

		public function getAthleticsAreas() : Vector.<ClientMapAreaData>
		{
			var areaSet : Vector.<ClientMapAreaData> = new Vector.<ClientMapAreaData>();
			for each (var areaData : ClientMapAreaData in areaDatas)
			{
				if (areaData.mType == MapAreaTypeEnum.ATHLETICS)
					areaSet.push(areaData);
			}
			return areaSet;
		}

		public function getSafeAreas() : Vector.<ClientMapAreaData>
		{
			var areaSet : Vector.<ClientMapAreaData> = new Vector.<ClientMapAreaData>();
			for each (var areaData : ClientMapAreaData in areaDatas)
			{
				if (areaData.mType == MapAreaTypeEnum.SAFE)
					areaSet.push(areaData);
			}
			return areaSet;
		}

		public function getSpellForbidAreas() : Vector.<ClientMapAreaData>
		{
			var areaSet : Vector.<ClientMapAreaData> = new Vector.<ClientMapAreaData>();
			for each (var areaData : ClientMapAreaData in areaDatas)
			{
				if (areaData.mType == MapAreaTypeEnum.SPELL_FORBID)
					areaSet.push(areaData);
			}
			return areaSet;
		}

		public function getStallAreas() : Vector.<ClientMapAreaData>
		{
			var areaSet : Vector.<ClientMapAreaData> = new Vector.<ClientMapAreaData>();
			for each (var areaData : ClientMapAreaData in areaDatas)
			{
				if (areaData.mType == MapAreaTypeEnum.STALL)
					areaSet.push(areaData);
			}
			return areaSet;
		}
	}
}
