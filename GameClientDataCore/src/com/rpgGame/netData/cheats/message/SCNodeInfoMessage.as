package com.rpgGame.netData.cheats.message{
	import com.rpgGame.netData.cheats.bean.NodeInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 发送节点信息
	 */
	public class SCNodeInfoMessage extends Message {
	
		//节点信息
		private var _info: NodeInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//节点信息
			writeBean(_info);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//节点信息
			_info = readBean(NodeInfo) as NodeInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 226103;
		}
		
		/**
		 * get 节点信息
		 * @return 
		 */
		public function get info(): NodeInfo{
			return _info;
		}
		
		/**
		 * set 节点信息
		 */
		public function set info(value: NodeInfo): void{
			this._info = value;
		}
		
	}
}