package com.rpgGame.coreData.info.move
{
	import flash.geom.Point;

	import org.game.netCore.net_protobuff.ByteBuffer;

	/**
	 *
	 * 角色移动数据
	 * @author L.L.M.Sunny
	 * 创建时间：2015-7-8 上午11:32:15
	 *
	 */
	public class RoleMoveInfo
	{
		public var roleID : Number;
		public var speed : int;
		public var startTm : Number = 0;
		public var pathList : Vector.<Point>;

		public function RoleMoveInfo()
		{
		}

		public function readFrom(buffer : ByteBuffer) : void
		{
			roleID = buffer.readVarint64();
			speed = buffer.readVarint64();
			startTm = buffer.readLong();
			var pathLen : int = buffer.readVarint32();
			pathList = new Vector.<Point>;
			for (var i : uint = 0; i < pathLen; i++)
			{
				var tileX : uint = buffer.readVarint32();
				var tileY : uint = buffer.readVarint32();
				var curtPos : Point = new Point(tileX, tileY);
				pathList.push(curtPos);
			}
		}
	}
}
