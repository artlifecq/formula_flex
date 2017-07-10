package com.rpgGame.netData.marriage.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 夫妻互动
	 */
	public class CSInteractionMessage extends Message {
	
		//互动类型  1 送花    2  拥抱    3  亲吻       4  洞房
		private var _type: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//互动类型  1 送花    2  拥抱    3  亲吻       4  洞房
			writeInt(_type);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//互动类型  1 送花    2  拥抱    3  亲吻       4  洞房
			_type = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 150107;
		}
		
		/**
		 * get 互动类型  1 送花    2  拥抱    3  亲吻       4  洞房
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 互动类型  1 送花    2  拥抱    3  亲吻       4  洞房
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
	}
}