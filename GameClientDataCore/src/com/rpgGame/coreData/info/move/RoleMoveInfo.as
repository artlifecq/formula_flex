package com.rpgGame.coreData.info.move
{
	import com.rpgGame.netData.map.message.SCSceneObjMoveMessage;
	import com.rpgGame.netData.structs.Position;
	
	import flash.geom.Point;
	
	import org.game.netCore.data.long;

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
		public var startTm : long = null;
		public var pathList : Vector.<Point>;

		public function RoleMoveInfo()
		{
		}

		public function setValue(msg : SCSceneObjMoveMessage) : void
		{
			roleID = msg.objId.ToGID();
			speed = msg.speed;
			startTm = msg.startTime;
			var pathLen : int = msg.positions.length;
			pathList = new Vector.<Point>;
			for (var i : uint = 0; i < pathLen; i++)
			{
				var pos:Position = msg.positions[i];
				var curtPos : Point = new Point(pos.x, pos.y);
				pathList.push(curtPos);
			}
		}
	}
}
