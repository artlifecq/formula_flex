package com.rpgGame.coreData.info.scene
{
	import com.rpgGame.coreData.enum.ReliveShowType;
	import com.rpgGame.coreData.type.ReliveType;
	
	import org.game.netCore.net_protobuff.ByteBuffer;

	/**
	 *
	 * 角色死亡信息
	 * @author fly.liuyang
	 * 创建时间：2014-6-13 下午5:40:26
	 * 
	 */
	public class DieInfo
	{
		
		//-------------------------------
		
		/**
		 * reliveOption 的意义: ReliveType
		 */		
		public var reliveOption:int;
		/**
		 * killerType 的意义: ReliveType
		 */		
		public var killerType:int;
		/**杀人的名字**/
		public var killerName:String;
		/**杀人的ID**/
		public var killerId:Number;
		/**杀人者的国家**/
		public var killCountry:int;
		/**复活时间**/
		public var reliveTimes:Number = 0;
		/**挂机复活时间**/
		public var trusteeshipReliveTime:Number;
		/**帮派名字**/
		public var guildName:String;
		/**死亡时间**/
		public var dieTime:Number;
		
		/**
		 * 服务器通知客户端已经死亡. 客户端收到此消息1秒后, 弹出死亡复活面板, 并将场景/人物/怪物 颜色抽黑
		 *
		 * 附带
		 *
		 * varint32 可完美复活类型以及击杀者的类型
		 *
		 * 客户端读取方式
		 *
		 * var speicialReliveInfo = byteArray.readVarint32();
		 *      // 复活类型：
		 *      // specialReliveInfo & 1 != 0 // 能够信春哥复活
		 *      // specialReliveInfo & 2 != 0 // 能够伤不起复活
		 *      // specialReliveInfo & 4 != 0 // 能够跑得快复活
		 *
		 * var reliveTime:int64 = byteArray.readVarint64(); // 服务器复活的时间
		 *
		 * var killerType: int = byteArray.readVarint32();
		 *      // killerType 的意义:
		 *      // 0: 英雄
		 *      // 1: 怪物
		 *      // 2: 无名氏 (bug?)
		 *
		 * var killerName:string = byteArray.readUTF()
		 *
		 * //杀手名字
		 * if (killerType == 0){
		 *     // 如果是英雄，再读一个英雄ID
		 *     var killerId:long = byteArray.readVarInt64();
		 *
		 *     var familyName:string = byteArray.readUTF();
		 *
		 *     if(buffer.readable()) {
		 *          country = byteArray.readVarInt32();
		 *     }
		 * }
		 *
		 */
		public function DieInfo( buffer:ByteBuffer = null)
		{
			if ( null == buffer )
				return;

			var type:int = buffer.readVarint32();
			if((type & 1) != 0)
				reliveOption = ReliveShowType.RELIVE_OTHER_TYPE_1;
			else if((type & 2) != 0 && (type & 4) != 0)
				reliveOption = ReliveShowType.RELIVE_OTHER_TYPE_4;
			else if((type & 2) != 0 )
				reliveOption = ReliveShowType.RELIVE_OTHER_TYPE_2;
			else if((type && 4) != 0)
				reliveOption = ReliveShowType.RELIVE_OTHER_TYPE_3;
			else
				reliveOption = ReliveShowType.RELIVE_NORMAL_TYPE;
			
			reliveTimes = buffer.readVarint64();
			
			killerId = -1;
			killerType = buffer.readVarint32();
			killerName = buffer.readUTF();
			
			switch (killerType)
			{
				case ReliveType.HERO_KILL_TYPE:	// 英雄
				{
					killerId = buffer.readVarint64();
					guildName = buffer.readUTF();
					if( buffer.bytesAvailable > 0 )
						killCountry = buffer.readVarint32();
					
					break;
				}
				case ReliveType.MONSTER_KILL_TYPE:	// 怪物
				{
					break;
				}
				default:	// 无名氏（bug?）
				{
					break;
				}
			}

		}
	}
}
