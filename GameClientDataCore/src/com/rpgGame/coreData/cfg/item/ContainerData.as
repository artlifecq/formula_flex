package com.rpgGame.coreData.cfg.item
{
	import org.game.netCore.net.ByteBuffer;

	/**
	 * 对应服务器对容器的需求 
	 * @author Mandragora
	 * 
	 */	
	public class ContainerData
	{
		/**
		 * 容器类型：
		 *      if(容器类型=MOUNT_EQUIPMENT){
		 *          (坐骑第几个槽位 << 8) | ContainerType
		 *      } else if(容器类型=STORAGE){
		 *          如果vip可以直接使用，可以不带npcId，返回的S2C里面，客户端如果不需要，也可以不拿npcId
		 *          (npcId << 8) | ContainerType
		 *      } else {
		 *          ContainerType
		 *      } 
		 * @param bytes
		 * 
		 */		
		public function ContainerData()
		{
		}
		public var containerId : int;
		public var index : int;
		
		public function readBytes(bytes:ByteBuffer):void
		{
			var temp : int = bytes.readVarint32();
			containerId = temp & 0xff;
//			if( containerId == ContainerType.MOUNT_EQUIPMENT || containerId == ContainerType.STORAGE )
//			{
//				index = containerId>>8;
//			}else
//				containerId = temp;
		}
	}
}