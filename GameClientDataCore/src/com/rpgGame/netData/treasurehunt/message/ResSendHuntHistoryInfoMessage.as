package com.rpgGame.netData.treasurehunt.message{
	import com.rpgGame.netData.treasurehunt.bean.TreasureHuntInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 发送寻宝记录
	 */
	public class ResSendHuntHistoryInfoMessage extends Message {
	
		//我的寻宝记录
		private var _myHuntInfos: Vector.<TreasureHuntInfo> = new Vector.<TreasureHuntInfo>();
		//全平台寻宝记录
		private var _huntInfos: Vector.<TreasureHuntInfo> = new Vector.<TreasureHuntInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//我的寻宝记录
			writeShort(_myHuntInfos.length);
			for (i = 0; i < _myHuntInfos.length; i++) {
				writeBean(_myHuntInfos[i]);
			}
			//全平台寻宝记录
			writeShort(_huntInfos.length);
			for (i = 0; i < _huntInfos.length; i++) {
				writeBean(_huntInfos[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//我的寻宝记录
			var myHuntInfos_length : int = readShort();
			for (i = 0; i < myHuntInfos_length; i++) {
				_myHuntInfos[i] = readBean(TreasureHuntInfo) as TreasureHuntInfo;
			}
			//全平台寻宝记录
			var huntInfos_length : int = readShort();
			for (i = 0; i < huntInfos_length; i++) {
				_huntInfos[i] = readBean(TreasureHuntInfo) as TreasureHuntInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 160105;
		}
		
		/**
		 * get 我的寻宝记录
		 * @return 
		 */
		public function get myHuntInfos(): Vector.<TreasureHuntInfo>{
			return _myHuntInfos;
		}
		
		/**
		 * set 我的寻宝记录
		 */
		public function set myHuntInfos(value: Vector.<TreasureHuntInfo>): void{
			this._myHuntInfos = value;
		}
		
		/**
		 * get 全平台寻宝记录
		 * @return 
		 */
		public function get huntInfos(): Vector.<TreasureHuntInfo>{
			return _huntInfos;
		}
		
		/**
		 * set 全平台寻宝记录
		 */
		public function set huntInfos(value: Vector.<TreasureHuntInfo>): void{
			this._huntInfos = value;
		}
		
	}
}