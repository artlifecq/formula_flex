package com.rpgGame.netData.map.message{
	import com.rpgGame.netData.map.bean.SceneObjInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 周围情况变化
	 */
	public class ResRoundObjectsMessage extends Message {
	
		//玩家周围对象信息
		private var _objInfos: Vector.<SceneObjInfo> = new Vector.<SceneObjInfo>();
		//移除的对象
		private var _removeObjs: Vector.<int> = new Vector.<int>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//玩家周围对象信息
			writeShort(_objInfos.length);
			for (i = 0; i < _objInfos.length; i++) {
				writeBean(_objInfos[i]);
			}
			//移除的对象
			writeShort(_removeObjs.length);
			for (i = 0; i < _removeObjs.length; i++) {
				writeShort(_removeObjs[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//玩家周围对象信息
			var objInfos_length : int = readShort();
			for (i = 0; i < objInfos_length; i++) {
				_objInfos[i] = readBean(SceneObjInfo) as SceneObjInfo;
			}
			//移除的对象
			var removeObjs_length : int = readShort();
			for (i = 0; i < removeObjs_length; i++) {
				_removeObjs[i] = readShort();
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 101125;
		}
		
		/**
		 * get 玩家周围对象信息
		 * @return 
		 */
		public function get objInfos(): Vector.<SceneObjInfo>{
			return _objInfos;
		}
		
		/**
		 * set 玩家周围对象信息
		 */
		public function set objInfos(value: Vector.<SceneObjInfo>): void{
			this._objInfos = value;
		}
		
		/**
		 * get 移除的对象
		 * @return 
		 */
		public function get removeObjs(): Vector.<int>{
			return _removeObjs;
		}
		
		/**
		 * set 移除的对象
		 */
		public function set removeObjs(value: Vector.<int>): void{
			this._removeObjs = value;
		}
		
	}
}