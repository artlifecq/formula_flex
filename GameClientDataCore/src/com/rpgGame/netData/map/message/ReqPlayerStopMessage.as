package com.rpgGame.netData.map.message{
	import com.rpgGame.netData.structs.Position;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 停止移动
	 */
	public class ReqPlayerStopMessage extends Message {
	
		//客户端玩家坐标
		private var _pos: com.rpgGame.netData.structs.Position;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//客户端玩家坐标
			writeBean(_pos);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//客户端玩家坐标
			_pos = readBean(com.rpgGame.netData.structs.Position) as com.rpgGame.netData.structs.Position;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 101205;
		}
		
		/**
		 * get 客户端玩家坐标
		 * @return 
		 */
		public function get pos(): com.rpgGame.netData.structs.Position{
			return _pos;
		}
		
		/**
		 * set 客户端玩家坐标
		 */
		public function set pos(value: com.rpgGame.netData.structs.Position): void{
			this._pos = value;
		}
		
	}
}