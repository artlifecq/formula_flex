package com.rpgGame.app.ui.main.buff
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.view.icon.BuffIcon;
	import com.rpgGame.core.events.BuffEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.enum.face.FaceTypeEnum;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.buff.BuffData;
	import com.rpgGame.coreData.role.RoleData;
	
	import feathers.controls.StateSkin;
	
	import org.client.mainCore.manager.EventManager;
	
	import starling.display.Sprite;
	
	/**
	 *buff显示条 
	 * @author dik
	 * 
	 */
	public class BuffBar extends SkinUI
	{
		private var roleId:int;
	
		private var _buffSp:BuffGridCon;
		private var _debuffSp:BuffGridCon;
		
		public function BuffBar(skin:StateSkin=null)
		{
			super(skin);
		
			initBuff();
		}
		
		override protected function  onShow() : void
		{
			
			
			
		}
		
		private function initBuff():void
		{
			//右到左下到上
			_buffSp=new BuffGridCon("buffbar_good",IcoSizeEnum.ICON_19,4,1,1);
			_debuffSp=new BuffGridCon("buffbar_bad",IcoSizeEnum.ICON_19,4,0,1);
			initEvent();
			this.addChild(_buffSp);
			this.addChild(_debuffSp);
			roleId=MainRoleManager.actor.id;
			var buffList : Vector.<BuffData>=(MainRoleManager.actor.data as RoleData).buffList;
			var num:int=buffList.length;
			for(var i:int=0;i<num;i++)
			{
				var data:BuffData=buffList[i];
				if(data._data.q_effect_time!=-1)
					createIcon(data);
			}
		}
		

		
		private function createIcon(data:BuffData):void
		{
			if(data.buffData.q_icon_show==0)
			{
				return;
			}
			if(data.buffData.q_effect_type==2)
			{//负面
				_debuffSp.createIcon(data);
			}else
			{
				_buffSp.createIcon(data);
			}
		}
		
		
		private function initEvent():void
		{
			EventManager.addEvent(BuffEvent.ADD_BUFF, addBuff);
			EventManager.addEvent(BuffEvent.REMOVE_BUFF, removeBuff);
		}
		private function removeBuff(buffData:BuffData):void
		{
			if(buffData.roleId!=roleId||buffData._data.q_effect_time==-1){
				return;
			}
			removeForDatas(buffData);
		}
		
		private function removeForDatas(buffData:BuffData):void
		{
			var icon:BuffIcon;
			var num:int,i:int;
			if(buffData.buffData.q_effect_type==2)
			{//负面
				_debuffSp.removeForDatas(buffData);
			}
			else
			{
				_buffSp.removeForDatas(buffData);
			}
		
		}

		
		private function addBuff(buffData:BuffData):void
		{
			if(buffData.roleId!=roleId||buffData._data.q_effect_time==-1){
				return;
			}
		
			createIcon(buffData);
		}
		
		public function resize(w : int, h : int) : void 
		{
			this.x=w/2;
			this.y=h-160;
		}
	}
}