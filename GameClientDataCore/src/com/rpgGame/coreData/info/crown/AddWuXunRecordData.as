package com.rpgGame.coreData.info.crown
{
	import app.message.CountryModuleObjProto.CountryModuleWuXunProto.AddWuXunRecordProto;

	public class AddWuXunRecordData
	{
		public function AddWuXunRecordData()
		{
		}
		/**
		 * 时间 
		 */		
		public var  time : Number; //
		/**
		 *击杀获得的武勋 
		 */		
		public var  killAddAmount : int; // 
		/**
		 *其他途径获得的武勋 
		 */		
		public var otherAddAmount :int; // 
		
		public function setup(cfg:AddWuXunRecordProto):void
		{
			time = cfg.time.toNumber();
			killAddAmount = cfg.killAddAmount?cfg.killAddAmount.toNumber():0;
			otherAddAmount = cfg.otherAddAmount?cfg.killAddAmount.toNumber():0;
		}
	}
}