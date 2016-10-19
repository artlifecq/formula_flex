package com.rpgGame.coreData.cfg.mount
{
	import app.message.MountDataProto;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 * 坐骑单元数据 
	 * @author 陈鹉光
	 * 
	 */	
	public class MountUnitData
	{
		/** 坐骑id **/
		public var id:int;
		/** 坐骑名 **/
		public var name:String;
		/** 坐骑类型（成年、宝宝、变异、二代） **/
		public var mountType:int;
		/** 前缀（0：勇猛的、1：迅捷的、2：机智的、3：坚毅的、4：强壮的） **/
		public var prefixType:int;
		/** 资质类型（0：普通、1：良好、2：优秀、3：超凡、4：完美） **/
		public var quality:int;
		/** 物种id **/
		public var speciesId:int;
		/** 升级需要经验在原有经验基础上的加成 **/
		public var upgradeExpAdditional:Number;
		/** 坐骑换装 **/
		public var resource:int;
		/** 骑乘的移动速度,会由于饥饿度增加导致速度降低(MountHungerDegreeDatasProto) **/
		public var rideMoveSpeed:int;
		/** 坐骑被拿去强化的时候会加多少点根骨 **/
		public var mountRefineAddVitality:int;
		/** 坐骑根骨每一级需要的经验 **/
		public var vitalityExpHash:HashMap;
		
		public function MountUnitData()
		{
		}
		
		/**
		 * 设置所有坐骑数据 
		 * @param data
		 * 
		 */			
		public function setMountData( data:MountDataProto ):void
		{
			if( data == null )
				return;
			id = data.id;
			name = data.name;
			mountType = data.mountType;
			prefixType = data.prefixType;
			quality = data.quality;
			speciesId = data.speciesId;
			upgradeExpAdditional = data.upgradeExpAdditional;
			resource = data.resource;
			rideMoveSpeed = data.rideMoveSpeed;
			
			vitalityExpHash = new HashMap();
			for (var i:int = 0; i < data.vitalityExp.length; i++) 
			{
				vitalityExpHash.add( i + 1, data.vitalityExp[i] );
			}
			mountRefineAddVitality = data.mountRefineAddVitalityExp;
		}
	}
}