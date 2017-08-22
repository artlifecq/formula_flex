package com.rpgGame.netData.yaota.message{
	import com.rpgGame.netData.structs.Position;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 返回玩家坐标
	 */
	public class SCGetPlayerPostionMessage extends Message {
	
		//坐标
		private var _positions: com.rpgGame.netData.structs.Position;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//坐标
			writeBean(_positions);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//坐标
			_positions = readBean(com.rpgGame.netData.structs.Position) as com.rpgGame.netData.structs.Position;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 129116;
		}
		
		/**
		 * get 坐标
		 * @return 
		 */
		public function get positions(): com.rpgGame.netData.structs.Position{
			return _positions;
		}
		
		/**
		 * set 坐标
		 */
		public function set positions(value: com.rpgGame.netData.structs.Position): void{
			this._positions = value;
		}
		
	}
}