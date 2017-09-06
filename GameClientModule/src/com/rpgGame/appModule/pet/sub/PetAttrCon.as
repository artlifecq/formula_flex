package com.rpgGame.appModule.pet.sub
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.utils.FightValueUtil;
	import com.rpgGame.coreData.cfg.AttValueConfig;
	
	import starling.display.Sprite;
	
	public class PetAttrCon extends Sprite
	{
		private var _pool:Vector.<PetAttrCellExt>=new Vector.<PetAttrCellExt>();
		private var _cellList:Vector.<PetAttrCellExt>=new Vector.<PetAttrCellExt>();
		private var _power:int;
		public function PetAttrCon()
		{
			super();
		}
		public function setData(curAttrId:int,nextArrId:int):void
		{
			_power=0;
			var cell:PetAttrCellExt;
			_pool=_pool.concat(_cellList);
			_cellList.length=0;
			var attrHash:HashMap=AttValueConfig.getAttrHash(curAttrId);
			if (attrHash==null) 
			{
				return;
			}
			if (nextArrId!=0) 
			{
				var nextHash:HashMap=AttValueConfig.getAttrHash(nextArrId);
				
			}
			if (!nextHash) 
			{
				nextHash=attrHash;
			}
			var keys:Array=attrHash.keys();
			var len:int=keys.length;		
			var type:int;
			var attrPower:int=FightValueUtil.calFightPowerByHash(attrHash,MainRoleManager.actorInfo.job);
			var nextPower:int=FightValueUtil.calFightPowerByHash(nextHash,MainRoleManager.actorInfo.job);
			_power=nextPower-attrPower;
			for (var i:int = 0; i < len; i++) 
			{
				type=keys[i];
				cell=getCell();
				cell.y=(cell.height+2)*i;
				cell.setData(type,attrHash.getValue(type),nextHash.getValue(type));
				this.addChild(cell);
				_cellList.push(cell);
			}
		}
		
		public function getAllAttPower():int
		{
			return _power;
		}
		
		public function getCell():PetAttrCellExt
		{
			if (_pool.length>0) 
			{
				return _pool.pop();
			}
			return new PetAttrCellExt();
		}
		public function showAttrAdd(bool:Boolean):void
		{
			for each (var cell:PetAttrCellExt in _cellList) 
			{
				cell.showAdd(bool);
			}
		}
	}
}