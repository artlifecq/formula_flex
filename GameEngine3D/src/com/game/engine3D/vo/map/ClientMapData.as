package com.game.engine3D.vo.map
{
	import flash.geom.Rectangle;
	import flash.utils.ByteArray;

	/**
	 *
	 * 客户端地图数据
	 * @author L.L.M.Sunny
	 * 创建时间：2015-7-27 下午2:03:17
	 *
	 */
	public class ClientMapData
	{
		private static const SCALE_RATIO : int = 100;
		public var version : int = 0;
		public var mapAreaVersion : int = 0;
		public var timeOfTheDayDataVersion : int = 0;
		public var cameraPropertyDataVersion : int = 0;
		public var mapRes : String = "";
		public var miniMapRes : String = "";
		public var miniMapRect : Rectangle = new Rectangle();
		public var radarMapRes : String = "";
		public var radarMapRect : Rectangle = new Rectangle();
		public var bgSoundRes : String = "";
		public var miniCorrectOffsetX : int = 0;
		public var miniCorrectOffsetY : int = 0;
		public var miniCorrectScaleX : int = 0;
		public var miniCorrectScaleY : int = 0;
		public var miniCorrectTilt : int = 0;
		public var miniCorrectRoll : int = 0;
		public var miniCorrectPan : int = 0;
		public var boundMinX : int = 0;
		public var boundMinY : int = 0;
		public var boundMaxX : int = 0;
		public var boundMaxY : int = 0;

		public var mapAreaCount : int = 0;
		public var areaDatas : Array = [];
		public var timeOfTheDayData : ClientMapTimeOfTheDayData;
		public var cameraPropertyData : ClientMapCameraPropertyData;

		public function ClientMapData()
		{
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
				mapRes = bytes.readUTF();
				miniMapRes = bytes.readUTF();
				miniMapRect.x = bytes.readUnsignedShort();
				miniMapRect.y = bytes.readUnsignedShort();
				miniMapRect.width = bytes.readUnsignedShort();
				miniMapRect.height = bytes.readUnsignedShort();

				radarMapRes = bytes.readUTF();
				radarMapRect.x = bytes.readUnsignedShort();
				radarMapRect.y = bytes.readUnsignedShort();
				radarMapRect.width = bytes.readUnsignedShort();
				radarMapRect.height = bytes.readUnsignedShort();

				bgSoundRes = bytes.readUTF();
				miniCorrectOffsetX = bytes.readInt();
				miniCorrectOffsetY = bytes.readInt();
				miniCorrectScaleX = bytes.readInt();
				miniCorrectScaleY = bytes.readInt();
				miniCorrectTilt = bytes.readInt();
				miniCorrectRoll = bytes.readInt();
				miniCorrectPan = bytes.readInt();
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
				miniMapRes = bytes.readUTF();
				miniMapRect.x = bytes.readUnsignedShort();
				miniMapRect.y = bytes.readUnsignedShort();
				miniMapRect.width = bytes.readUnsignedShort();
				miniMapRect.height = bytes.readUnsignedShort();

				radarMapRes = bytes.readUTF();
				radarMapRect.x = bytes.readUnsignedShort();
				radarMapRect.y = bytes.readUnsignedShort();
				radarMapRect.width = bytes.readUnsignedShort();
				radarMapRect.height = bytes.readUnsignedShort();

				bgSoundRes = bytes.readUTF();
				miniCorrectOffsetX = bytes.readInt();
				miniCorrectOffsetY = bytes.readInt();
				miniCorrectScaleX = bytes.readInt();
				miniCorrectScaleY = bytes.readInt();
				miniCorrectTilt = bytes.readInt();
				miniCorrectRoll = bytes.readInt();
				miniCorrectPan = bytes.readInt();
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
				miniMapRes = bytes.readUTF();
				radarMapRes = bytes.readUTF();
				bgSoundRes = bytes.readUTF();
				miniCorrectOffsetX = bytes.readInt();
				miniCorrectOffsetY = bytes.readInt();
				miniCorrectScaleX = bytes.readInt();
				miniCorrectScaleY = bytes.readInt();
				miniCorrectTilt = bytes.readInt();
				miniCorrectRoll = bytes.readInt();
				miniCorrectPan = bytes.readInt();
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
				miniMapRes = bytes.readUTF();
				bgSoundRes = bytes.readUTF();
				miniCorrectOffsetX = bytes.readInt();
				miniCorrectOffsetY = bytes.readInt();
				miniCorrectScaleX = bytes.readInt();
				miniCorrectScaleY = bytes.readInt();
				miniCorrectTilt = bytes.readInt();
				miniCorrectRoll = bytes.readInt();
				miniCorrectPan = bytes.readInt();
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
				miniMapRes = bytes.readUTF();
				bgSoundRes = bytes.readUTF();
				miniCorrectOffsetX = bytes.readInt();
				miniCorrectOffsetY = bytes.readInt();
				miniCorrectScaleX = bytes.readInt();
				miniCorrectScaleY = bytes.readInt();
				miniCorrectTilt = bytes.readInt();
				miniCorrectRoll = bytes.readInt();
				miniCorrectPan = bytes.readInt();

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
				miniMapRes = bytes.readUTF();
				miniCorrectOffsetX = bytes.readInt();
				miniCorrectOffsetY = bytes.readInt();
				miniCorrectScaleX = bytes.readInt();
				miniCorrectScaleY = bytes.readInt();
				miniCorrectTilt = bytes.readInt();
				miniCorrectRoll = bytes.readInt();
				miniCorrectPan = bytes.readInt();

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
				miniMapRes = bytes.readUTF();
				miniCorrectOffsetX = bytes.readInt();
				miniCorrectOffsetY = bytes.readInt();
				miniCorrectScaleX = bytes.readInt();
				miniCorrectScaleY = bytes.readInt();
				miniCorrectTilt = bytes.readInt();
				miniCorrectRoll = bytes.readInt();
				miniCorrectPan = bytes.readInt();

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
			var value : Number = (miniCorrectScaleX > 0 ? miniCorrectScaleX / SCALE_RATIO : 1);
			value = value == 0 ? 1 : value;
			return 1;
		}

		public function get miniScaleY() : Number
		{
			var value : Number = (miniCorrectScaleY > 0 ? miniCorrectScaleY / SCALE_RATIO : 1);
			value = value == 0 ? 1 : value;
			return 1;
		}

		public function getDynamicObstacleArea(id : int) : ClientMapAreaData
		{
			for each (var areaData : ClientMapAreaData in areaDatas)
			{
				if (areaData.type == MapAreaTypeEnum.DYNAMIC_OBSTACLE && areaData.id == id)
					return areaData;
			}
			return null;
		}

		public function getObstacleAreas() : Vector.<ClientMapAreaData>
		{
			var areaSet : Vector.<ClientMapAreaData> = new Vector.<ClientMapAreaData>();
			for each (var areaData : ClientMapAreaData in areaDatas)
			{
				if (areaData.type == MapAreaTypeEnum.OBSTACLE)
					areaSet.push(areaData);
			}
			return areaSet;
		}

		public function getCameraPropertyAreas() : Vector.<ClientMapAreaData>
		{
			var areaSet : Vector.<ClientMapAreaData> = new Vector.<ClientMapAreaData>();
			for each (var areaData : ClientMapAreaData in areaDatas)
			{
				if (areaData.type == MapAreaTypeEnum.CAMERA_PROPERTY)
					areaSet.push(areaData);
			}
			return areaSet;
		}

		public function getAthleticsAreas() : Vector.<ClientMapAreaData>
		{
			var areaSet : Vector.<ClientMapAreaData> = new Vector.<ClientMapAreaData>();
			for each (var areaData : ClientMapAreaData in areaDatas)
			{
				if (areaData.type == MapAreaTypeEnum.ATHLETICS)
					areaSet.push(areaData);
			}
			return areaSet;
		}

		public function getSafeAreas() : Vector.<ClientMapAreaData>
		{
			var areaSet : Vector.<ClientMapAreaData> = new Vector.<ClientMapAreaData>();
			for each (var areaData : ClientMapAreaData in areaDatas)
			{
				if (areaData.type == MapAreaTypeEnum.SAFE)
					areaSet.push(areaData);
			}
			return areaSet;
		}

		public function getSpellForbidAreas() : Vector.<ClientMapAreaData>
		{
			var areaSet : Vector.<ClientMapAreaData> = new Vector.<ClientMapAreaData>();
			for each (var areaData : ClientMapAreaData in areaDatas)
			{
				if (areaData.type == MapAreaTypeEnum.SPELL_FORBID)
					areaSet.push(areaData);
			}
			return areaSet;
		}

		public function getStallAreas() : Vector.<ClientMapAreaData>
		{
			var areaSet : Vector.<ClientMapAreaData> = new Vector.<ClientMapAreaData>();
			for each (var areaData : ClientMapAreaData in areaDatas)
			{
				if (areaData.type == MapAreaTypeEnum.STALL)
					areaSet.push(areaData);
			}
			return areaSet;
		}
	}
}
