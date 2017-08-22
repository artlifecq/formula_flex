package com.rpgGame.netData.monster.message{
	import com.rpgGame.netData.monster.bean.HateInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 发送玩家对BOSS仇恨列表
	 */
	public class ResBossHateInfosToClientMessage extends Message {
	
		//玩家对BOSS仇恨列表
		private var _hateInfos: Vector.<HateInfo> = new Vector.<HateInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//玩家对BOSS仇恨列表
			writeShort(_hateInfos.length);
			for (i = 0; i < _hateInfos.length; i++) {
				writeBean(_hateInfos[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//玩家对BOSS仇恨列表
			var hateInfos_length : int = readShort();
			for (i = 0; i < hateInfos_length; i++) {
				_hateInfos[i] = readBean(HateInfo) as HateInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 114121;
		}
		
		/**
		 * get 玩家对BOSS仇恨列表
		 * @return 
		 */
		public function get hateInfos(): Vector.<HateInfo>{
			return _hateInfos;
		}
		
		/**
		 * set 玩家对BOSS仇恨列表
		 */
		public function set hateInfos(value: Vector.<HateInfo>): void{
			this._hateInfos = value;
		}
		
	}
}