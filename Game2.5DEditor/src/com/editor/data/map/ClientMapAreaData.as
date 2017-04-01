package com.editor.data.map
{
	import com.editor.cfg.ConfigData;
	import com.editor.data.ConfigDesc;
	import com.editor.data.TabelData;
	import com.game.engine3D.vo.map.ClientMapAreaGridData;
	
	import flash.geom.Point;
	import flash.geom.Vector3D;
	import flash.utils.ByteArray;

	/**
	 *
	 * 客户端地图区域数据
	 * @author L.L.M.Sunny
	 * 创建时间：2015-9-9 下午2:03:17
	 *
	 */
	dynamic public class ClientMapAreaData extends ConfigData
	{
		public static function setFieldLabelsAndTips(configDesc : ConfigDesc) : void
		{
			configDesc.fieldLabels["type"] = "类型";
			configDesc.listMapping["type"] = MapAreaTypeEnum.getTypeList();
			configDesc.fieldLabels["area"] = "区域";
			configDesc.fieldLabels["forbidSpells"] = "禁止技能类型集";
			configDesc.fieldLabels["gridWidth"] = "栅格宽度";
			configDesc.fieldLabels["gridHeight"] = "栅格高度";
			configDesc.fieldLabels["gridDirection"] = "栅格方向";
		}

		private var _version : int = 0;
		private var _spellTypes : Array = null;
		public var gridLen : int = 0;
		public var grids : Vector.<ClientMapAreaGridData> = null;

		public function ClientMapAreaData()
		{
			super();
			this["type"] = 0;
			this["area"] = "";
			this["cameraXDeg"] = 0;
			this["cameraYDeg"] = 0;
			this["cameraDistance"] = 0;
			this["forbidSpells"] = "";
			this["gridWidth"] = 0;
			this["gridHeight"] = 0;
			this["gridDirection"] = 0;
		}

		public function toTabel(tabel : TabelData) : void
		{
			var sceneAreaPoints : Array = [];
			var points : Vector.<Point> = getPoints();
			var pLen : int = points.length;
			for (var pi : int = 0; pi < pLen; pi++)
			{
				var p : Point = points[pi];
				sceneAreaPoints.push(p.x + "=" + p.y);
			}
			var configDesc : ConfigDesc = tabel.getConfigDesc();
			ConfigData.create(configDesc, ["id", "type", "area", "cameraXDeg", "cameraYDeg", "cameraDistance", "forbidSpells", "gridWidth", "gridHeight", "gridDirection"], //
				[id, mType, sceneAreaPoints.join(";"), mCameraXDeg, mCameraYDeg, mCameraDistance, mForbidSpells, mGridWidth, mGridHeight, mGridDirection], tabel.dataConstructor);
		}

		public function get mCameraDistance() : int
		{
			return this["cameraDistance"];
		}

		public function set mCameraDistance(value : int) : void
		{
			this["cameraDistance"] = value;
		}

		public function get mCameraYDeg() : int
		{
			return this["cameraYDeg"];
		}

		public function set mCameraYDeg(value : int) : void
		{
			this["cameraYDeg"] = value;
		}

		public function set mCameraXDeg(value : int) : void
		{
			this["cameraXDeg"] = value;
		}

		public function get mCameraXDeg() : int
		{
			return this["cameraXDeg"];
		}

		public function set mForbidSpells(value : String) : void
		{
			this["forbidSpells"] = value;
		}

		public function get mForbidSpells() : String
		{
			return this["forbidSpells"];
		}

		public function get mType() : int
		{
			return this["type"];
		}

		public function set mType(value : int) : void
		{
			this["type"] = value;
		}

		public function get mGridWidth() : int
		{
			return this["gridWidth"];
		}

		public function set mGridWidth(value : int) : void
		{
			this["gridWidth"] = value;
		}

		public function get mGridHeight() : int
		{
			return this["gridHeight"];
		}

		public function set mGridHeight(value : int) : void
		{
			this["gridHeight"] = value;
		}

		public function get mGridDirection() : int
		{
			return this["gridDirection"];
		}

		public function set mGridDirection(value : int) : void
		{
			this["gridDirection"] = value;
		}

		override protected function setProperty(name : String, value : *) : void
		{
			super.setProperty(name, value);
			if (name == "type")
				this.name = MapAreaTypeEnum.nameByType[mType];
		}

		public function get mArea() : String
		{
			return this["area"];
		}

		public function set mArea(value : String) : void
		{
			this["area"] = value;
		}

		public function getPoints() : Vector.<Point>
		{
			var points : Vector.<Point> = new Vector.<Point>();
			var areaVPosArr : Array = mArea.split(";");
			for each (var mposStr : String in areaVPosArr)
			{
				var pArr : Array = mposStr.split("=");
				var posx : int = pArr[0];
				var posy : int = pArr[1];
				var pos : Point = new Point(posx, posy);
				points.push(pos);
			}
			return points;
		}

		public function writeTo(bytes : ByteArray) : void
		{
			bytes.writeInt(id);
			bytes.writeByte(mType);
			switch (mType)
			{
				case MapAreaTypeEnum.CAMERA_PROPERTY:
					bytes.writeShort(mCameraXDeg);
					bytes.writeShort(mCameraYDeg);
					bytes.writeShort(mCameraDistance);
					break;
				case MapAreaTypeEnum.SPELL_FORBID:
					var spellTypes : Array = getForbidSpells();
					var spellLen : int = spellTypes.length;
					bytes.writeByte(spellLen);
					for each (var spellType : int in spellTypes)
					{
						bytes.writeShort(spellType);
					}
					break;
				case MapAreaTypeEnum.STALL:
					bytes.writeShort(mGridWidth);
					bytes.writeShort(mGridHeight);
					bytes.writeShort(mGridDirection);
					gridLen = grids ? grids.length : 0;
					bytes.writeShort(gridLen);
					for (var m : int = 0; m < gridLen; m++)
					{
						var gridData : ClientMapAreaGridData = grids[m];
						bytes.writeInt(gridData.id);
						bytes.writeInt(gridData.gridX);
						bytes.writeInt(gridData.gridY);
					}
					break;
				default:
					break;
			}
			var points : Vector.<Point> = getPoints();
			var pLen : int = points.length;
			bytes.writeByte(pLen);
			for (var i : int = 0; i < pLen; i++)
			{
				var p : Point = points[i];
				bytes.writeInt(p.x);
				bytes.writeInt(p.y);
			}
		}

		public function readFrom(version : int, bytes : ByteArray) : void
		{
			_version = version;
			var spellLen : int;
			var n : int;
			var gridId : int;
			var gridX : int;
			var gridY : int;
			var gridData : ClientMapAreaGridData;
			var pLen : int;
			var pointsInfo : Array;
			var px : int;
			var py : int;
			if (_version == 3)
			{
				id = bytes.readInt();
				mType = bytes.readByte();
				switch (mType)
				{
					case MapAreaTypeEnum.CAMERA_PROPERTY:
						mCameraXDeg = bytes.readUnsignedShort();
						mCameraYDeg = bytes.readUnsignedShort();
						mCameraDistance = bytes.readUnsignedShort();
						break;
					case MapAreaTypeEnum.SPELL_FORBID:
						_spellTypes = [];
						spellLen = bytes.readByte();
						for (n = 0; n < spellLen; n++)
						{
							_spellTypes.push(bytes.readShort());
						}
						mForbidSpells = _spellTypes.join(";");
						break;
					case MapAreaTypeEnum.STALL:
						grids = new Vector.<ClientMapAreaGridData>();
						mGridWidth = bytes.readShort();
						mGridHeight = bytes.readShort();
						mGridDirection = bytes.readShort();
						gridLen = bytes.readShort();
						for (n = 0; n < gridLen; n++)
						{
							gridId = bytes.readInt();
							gridX = bytes.readInt();
							gridY = bytes.readInt();
							gridData = new ClientMapAreaGridData(gridId, gridX, gridY, mGridWidth, mGridHeight);
							grids.push(gridData);
						}
						break;
					default:
						break;
				}
				pLen = bytes.readUnsignedByte();
				pointsInfo = [];
				for (n = 0; n < pLen; n++)
				{
					px = bytes.readInt();
					py = bytes.readInt();
					pointsInfo.push(px + "=" + py);
				}
				mArea = pointsInfo.join(";");
			}
			else if (_version == 0 || _version == 2)
			{
				id = bytes.readInt();
				mType = bytes.readByte();
				switch (mType)
				{
					case MapAreaTypeEnum.CAMERA_PROPERTY:
						mCameraXDeg = bytes.readUnsignedShort();
						mCameraYDeg = bytes.readUnsignedShort();
						mCameraDistance = bytes.readUnsignedShort();
						break;
					case MapAreaTypeEnum.SPELL_FORBID:
						_spellTypes = [];
						spellLen = bytes.readByte();
						for (n = 0; n < spellLen; n++)
						{
							_spellTypes.push(bytes.readShort());
						}
						mForbidSpells = _spellTypes.join(";");
						break;
					case MapAreaTypeEnum.STALL:
						grids = new Vector.<ClientMapAreaGridData>();
						mGridWidth = bytes.readShort();
						mGridHeight = bytes.readShort();
						gridLen = bytes.readShort();
						for (n = 0; n < gridLen; n++)
						{
							gridId = bytes.readInt();
							gridX = bytes.readInt();
							gridY = bytes.readInt();
							gridData = new ClientMapAreaGridData(gridId, gridX, gridY, mGridWidth, mGridHeight);
							grids.push(gridData);
						}
						break;
					default:
						break;
				}
				pLen = bytes.readUnsignedByte();
				pointsInfo = [];
				for (n = 0; n < pLen; n++)
				{
					px = bytes.readInt();
					py = bytes.readInt();
					pointsInfo.push(px + "=" + py);
				}
				mArea = pointsInfo.join(";");
			}
		}

		public function getVector3Ds() : Vector.<Vector3D>
		{
			var vector3Ds : Vector.<Vector3D> = new Vector.<Vector3D>();
			var points : Vector.<Point> = getPoints();
			for each (var p : Point in points)
			{
				vector3Ds.push(new Vector3D(p.x, 0, p.y));
			}
			return vector3Ds;
		}

		public function getForbidSpells() : Array
		{
			return mForbidSpells.split(";");
		}
	}
}
