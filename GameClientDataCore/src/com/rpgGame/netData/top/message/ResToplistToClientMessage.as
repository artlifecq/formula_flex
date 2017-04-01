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
	 * 返回前端排行榜列表
	 */
	public class ResToplistToClientMessage extends Message {
	
		//当前玩家的排行信息
		private var _meTopInfo: TopInfo;
		
		//排行榜列表
		private var _topInfolist: Vector.<TopInfo> = new Vector.<TopInfo>();
		//总长度
		private var _length: int;
		
		//排行类型 1等级 2坐骑 3 战斗力 ....
		private var _toptype: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//当前玩家的排行信息
			writeBean(_meTopInfo);
			//排行榜列表
			writeShort(_topInfolist.length);
			for (i = 0; i < _topInfolist.length; i++) {
				writeBean(_topInfolist[i]);
			}
			//总长度
			writeInt(_length);
			//排行类型 1等级 2坐骑 3 战斗力 ....
			writeInt(_toptype);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//当前玩家的排行信息
			_meTopInfo = readBean(TopInfo) as TopInfo;
			//排行榜列表
			var topInfolist_length : int = readShort();
			for (i = 0; i < topInfolist_length; i++) {
				_topInfolist[i] = readBean(TopInfo) as TopInfo;
			}
			//总长度
			_length = readInt();
			//排行类型 1等级 2坐骑 3 战斗力 ....
			_toptype = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 141101;
		}
		
		/**
		 * get 当前玩家的排行信息
		 * @return 
		 */
		public function get meTopInfo(): TopInfo{
			return _meTopInfo;
		}
		
		/**
		 * set 当前玩家的排行信息
		 */
		public function set meTopInfo(value: TopInfo): void{
			this._meTopInfo = value;
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
		 * get 总长度
		 * @return 
		 */
		public function get length(): int{
			return _length;
		}
		
		/**
		 * set 总长度
		 */
		public function set length(value: int): void{
			this._length = value;
		}
		
		/**
		 * get 排行类型 1等级 2坐骑 3 战斗力 ....
		 * @return 
		 */
		public function get toptype(): int{
			return _toptype;
		}
		
		/**
		 * set 排行类型 1等级 2坐骑 3 战斗力 ....
		 */
		public function set toptype(value: int): void{
			this._toptype = value;
		}
		
	}
}