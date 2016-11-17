package com.rpgGame.coreData.role
{
	import com.rpgGame.coreData.cfg.biao.BiaoCfgData;
	import com.rpgGame.coreData.cfg.biao.BiaoPersonData;
	
	import app.message.BiaoResProto;
	import app.message.BiaoType;
	
	import org.game.netCore.net_protobuff.ByteBuffer;

	public class BiaoCheData extends RoleData
	{
		/** 主人id */
		public var ownerID:Number;
		/** 主人名字 */
		public var ownerName:String;
		/** 镖车品质 **/
		public var quality:int;
		/** 是否是无敌镖车 **/
		public var isInvivcibleBiao:Boolean;
		/** 是否破损 **/
		public var isBroken:Boolean;
		/** 镖车过期时间 **/
		public var expirationTime:Number;
		/** 镖车所在的场景id **/
		public var sceneId:int;	
		/** 场景是哪个国家的   副本、中立时是 0，是无效值 **/
		public var sceneSequence:int
		/** 是否是国运期间接的镖车 **/
		public var isGuoInTime:Boolean;
		/** 接受时花费了多少数值型的钱,用于计算投保时候的显示 **/
		public var useSilver :int;
		/** 是否投保 **/
		public var isTouBao : Boolean;
		/** 所有线 **/
		public var line:int;
		/** 镖车类型 **/
		public var biaoType:int;
		/** 下一个需要验镖的npc的下标 **/
		public var nextIndex:int;
		/** 镖车移动速度 **/
		public var moveSpeed:int;
		
		public function BiaoCheData(type:int)
		{
			super(RoleType.TYPE_BIAOCHE)
		}
		
		/**
		 * 镖车外形 
		 * @return 
		 * 
		 */		
		public function getModeRes():String
		{
			var data:BiaoPersonData = BiaoCfgData.getPersonalDataAtLevel(level);
			var biaoRes:BiaoResProto = isBroken ? data.broken_biao_res : data.normal_biao_res;
			var path:String = biaoRes.res[quality];
			return path;
		}
		
		/**
		 * 设置上线的时候镖车的信息，收到这条消息说明有镖车 
		 * @param byte
		 * 
		 */		
		public function setYunBiaoProtoOnlogin( byte : ByteBuffer ):void
		{
			sceneId = byte.readVarint32();
			sceneSequence = byte.readVarint32();
			expirationTime = byte.readVarint64();
			quality = byte.readVarint32();
			x = byte.readVarint32();
			y = byte.readVarint32();
			hp = byte.readVarint64();
			totalStat.life = byte.readVarint64();
			totalStat.moveSpeed = byte.readVarint64();
			biaoType = byte.readVarint32();
			switch(biaoType)
			{
				case BiaoType.PERSONAL:
					isBroken = byte.readBoolean();
					nextIndex = byte.readVarint32();
					break;
			}
		}
		
		/**
		 * 你的镖车停止了
		 *
		 * <p>
		 * varint32 场景id
		 * varint32 所有线
		 * varint32 场景所属国家
		 * varint32 x
		 * varint32 y
		 */    
		public function setYunBiaoStopInfo( byte : ByteBuffer ):void
		{
			sceneId = byte.readVarint32();
			line = byte.readVarint32();
			sceneSequence = byte.readVarint32();
			x = byte.readVarint32();
			y = byte.readVarint32();
		}
	}
}

