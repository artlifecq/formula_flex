package com.rpgGame.netData.top.message{
	import com.rpgGame.netData.top.bean.TopInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 返回前端魁首列表
	 */
	public class ResListLeaderToClientMessage extends Message {
	
		//排行榜列表
		private var _topInfolist: Vector.<TopInfo> = new Vector.<TopInfo>();
		//0是魁首列表,排行类型 1等级 2坐骑 3 战斗力 ....
		private var _toptype: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//排行榜列表
			writeShort(_topInfolist.length);
			for (i = 0; i < _topInfolist.length; i++) {
				writeBean(_topInfolist[i]);
			}
			//0是魁首列表,排行类型 1等级 2坐骑 3 战斗力 ....
			writeInt(_toptype);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//排行榜列表
			var topInfolist_length : int = readShort();
			for (i = 0; i < topInfolist_length; i++) {
				_topInfolist[i] = readBean(TopInfo) as TopInfo;
			}
			//0是魁首列表,排行类型 1等级 2坐骑 3 战斗力 ....
			_toptype = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 141102;
		}
		
		/**
		 * get 排行榜列表
		 * @return 
		 */
		public function get topInfolist(): Vector.<TopInfo>{
			return _topInfolist;
		}
		
		/**
		 * set 排行榜列表
		 */
		public function set topInfolist(value: Vector.<TopInfo>): void{
			this._topInfolist = value;
		}
		
		/**
		 * get 0是魁首列表,排行类型 1等级 2坐骑 3 战斗力 ....
		 * @return 
		 */
		public function get toptype(): int{
			return _toptype;
		}
		
		/**
		 * set 0是魁首列表,排行类型 1等级 2坐骑 3 战斗力 ....
		 */
		public function set toptype(value: int): void{
			this._toptype = value;
		}
		
	}
}