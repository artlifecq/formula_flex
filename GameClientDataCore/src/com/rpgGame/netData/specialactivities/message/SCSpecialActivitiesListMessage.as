package com.rpgGame.netData.specialactivities.message{
	import com.rpgGame.netData.specialactivities.bean.SpecialActivityInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 返回活动信息列表
	 */
	public class SCSpecialActivitiesListMessage extends Message {
	
		//返回活动列表信息
		private var _activityInfolist: Vector.<SpecialActivityInfo> = new Vector.<SpecialActivityInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//返回活动列表信息
			writeShort(_activityInfolist.length);
			for (i = 0; i < _activityInfolist.length; i++) {
				writeBean(_activityInfolist[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//返回活动列表信息
			var activityInfolist_length : int = readShort();
			for (i = 0; i < activityInfolist_length; i++) {
				_activityInfolist[i] = readBean(SpecialActivityInfo) as SpecialActivityInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 162101;
		}
		
		/**
		 * get 返回活动列表信息
		 * @return 
		 */
		public function get activityInfolist(): Vector.<SpecialActivityInfo>{
			return _activityInfolist;
		}
		
		/**
		 * set 返回活动列表信息
		 */
		public function set activityInfolist(value: Vector.<SpecialActivityInfo>): void{
			this._activityInfolist = value;
		}
		
	}
}