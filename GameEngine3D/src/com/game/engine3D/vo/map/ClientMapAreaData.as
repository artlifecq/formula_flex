package com.game.engine3D.vo.map
{
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
	public class ClientMapAreaData
	{
		private var _version : int = 0;
		
		public var id : int = 0;
		public var type : int = 0;
		public var cameraXDeg : int = 0;
		public var cameraYDeg : int = 0;
		public var cameraDistance : int = 0;
		public var roleDirection : int = 0;
		public var points : Vector.<Point> = null;
		public var gridWidth : int = 0;
		public var gridHeight : int = 0;
		public var gridDirection : int = 0;
		public var gridLen : int = 0;
		public var grids : Vector.<ClientMapAreaGridData> = null;
		public var depth : int = 0;
		public var action : int = 0;
		public var bgSound : String = "";
		public var envSound : String = "";
		private var _forbidSpellTypes : Array = null;
		
		public function ClientMapAreaData()
		{
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
			var p : Point;
			if (_version == 4)
			{
				id = bytes.readInt();
				type = bytes.readByte();
				switch (type)
				{
					case MapAreaTypeEnum.CAMERA_PROPERTY:
						cameraXDeg = bytes.readUnsignedShort();
						cameraYDeg = bytes.readUnsignedShort();
						cameraDistance = bytes.readUnsignedShort();
						roleDirection = bytes.readUnsignedShort();
						break;
					case MapAreaTypeEnum.SPELL_FORBID:
						_forbidSpellTypes = [];
						spellLen = bytes.readByte();
						for (n = 0; n < spellLen; n++)
						{
							_forbidSpellTypes.push(bytes.readShort());
						}
						break;
					case MapAreaTypeEnum.STALL:
						grids = new Vector.<ClientMapAreaGridData>();
						gridWidth = bytes.readShort();
						gridHeight = bytes.readShort();
						gridDirection = bytes.readShort();
						gridLen = bytes.readShort();
						for (n = 0; n < gridLen; n++)
						{
							gridId = bytes.readInt();
							gridX = bytes.readInt();
							gridY = bytes.readInt();
							gridData = new ClientMapAreaGridData(gridId, gridX, gridY, gridWidth, gridHeight);
							grids.push(gridData);
						}
						break;
					case MapAreaTypeEnum.SWIM:
						depth = bytes.readShort();
						action = bytes.readShort();
						break;
					case MapAreaTypeEnum.SOUND:
						bgSound = bytes.readUTF();
						envSound = bytes.readUTF();
						break;
					default:
						break;
				}
				pLen = bytes.readUnsignedByte();
				points = new Vector.<Point>();
				for (n = 0; n < pLen; n++)
				{
					p = new Point();
					p.x = bytes.readInt();
					p.y = bytes.readInt();
					points.push(p);
				}
			}
			else if (_version == 3)
			{
				id = bytes.readInt();
				type = bytes.readByte();
				switch (type)
				{
					case MapAreaTypeEnum.CAMERA_PROPERTY:
						cameraXDeg = bytes.readUnsignedShort();
						cameraYDeg = bytes.readUnsignedShort();
						cameraDistance = bytes.readUnsignedShort();
						break;
					case MapAreaTypeEnum.SPELL_FORBID:
						_forbidSpellTypes = [];
						spellLen = bytes.readByte();
						for (n = 0; n < spellLen; n++)
						{
							_forbidSpellTypes.push(bytes.readShort());
						}
						break;
					case MapAreaTypeEnum.STALL:
						grids = new Vector.<ClientMapAreaGridData>();
						gridWidth = bytes.readShort();
						gridHeight = bytes.readShort();
						gridDirection = bytes.readShort();
						gridLen = bytes.readShort();
						for (n = 0; n < gridLen; n++)
						{
							gridId = bytes.readInt();
							gridX = bytes.readInt();
							gridY = bytes.readInt();
							gridData = new ClientMapAreaGridData(gridId, gridX, gridY, gridWidth, gridHeight);
							grids.push(gridData);
						}
						break;
					default:
						break;
				}
				pLen = bytes.readUnsignedByte();
				points = new Vector.<Point>();
				for (n = 0; n < pLen; n++)
				{
					p = new Point();
					p.x = bytes.readInt();
					p.y = bytes.readInt();
					points.push(p);
				}
			}
			else if (_version == 0 || _version == 2)
			{
				id = bytes.readInt();
				type = bytes.readByte();
				switch (type)
				{
					case MapAreaTypeEnum.CAMERA_PROPERTY:
						cameraXDeg = bytes.readUnsignedShort();
						cameraYDeg = bytes.readUnsignedShort();
						cameraDistance = bytes.readUnsignedShort();
						break;
					case MapAreaTypeEnum.SPELL_FORBID:
						_forbidSpellTypes = [];
						spellLen = bytes.readByte();
						for (n = 0; n < spellLen; n++)
						{
							_forbidSpellTypes.push(bytes.readShort());
						}
						break;
					case MapAreaTypeEnum.STALL:
						grids = new Vector.<ClientMapAreaGridData>();
						gridWidth = bytes.readShort();
						gridHeight = bytes.readShort();
						gridLen = bytes.readShort();
						for (n = 0; n < gridLen; n++)
						{
							gridId = bytes.readInt();
							gridX = bytes.readInt();
							gridY = bytes.readInt();
							gridData = new ClientMapAreaGridData(gridId, gridX, gridY, gridWidth, gridHeight);
							grids.push(gridData);
						}
						break;
					default:
						break;
				}
				pLen = bytes.readUnsignedByte();
				points = new Vector.<Point>();
				for (n = 0; n < pLen; n++)
				{
					p = new Point();
					p.x = bytes.readInt();
					p.y = bytes.readInt();
					points.push(p);
				}
			}
		}
		
		public function getVector3Ds() : Vector.<Vector3D>
		{
			var vector3Ds : Vector.<Vector3D> = new Vector.<Vector3D>();
			for each (var p : Point in points)
			{
				vector3Ds.push(new Vector3D(p.x, 0, p.y));
			}
			return vector3Ds;
		}
		
		public function getForbidSpells() : Array
		{
			return _forbidSpellTypes;
		}
		
		public function getGridById(id : int) : ClientMapAreaGridData
		{
			if (!grids)
			{
				return null;
			}
			for each (var gridData : ClientMapAreaGridData in grids)
			{
				if (gridData.id == id)
				{
					return gridData;
				}
			}
			return null;
		}
		
		public function getPosInGrid(x : int, y : int) : ClientMapAreaGridData
		{
			if (!grids)
			{
				return null;
			}
			for each (var gridData : ClientMapAreaGridData in grids)
			{
				if (x > gridData.gridLeft && x <= gridData.gridRight && y > gridData.gridTop && y <= gridData.gridBottom)
				{
					return gridData;
				}
			}
			return null;
		}
	}
}
