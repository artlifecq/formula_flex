package com.rpgGame.app.ui.main.buff
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.view.icon.BuffIcon;
	import com.rpgGame.core.events.BuffEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.view.uiComponent.face.cd.CDDataManager;
	import com.rpgGame.coreData.enum.face.FaceTypeEnum;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.buff.BuffData;
	import com.rpgGame.coreData.role.RoleData;
	
	import feathers.controls.StateSkin;
	
	import org.client.mainCore.manager.EventManager;
	
	import starling.core.Starling;
	import starling.display.Sprite;
	
	/**
	 *buff显示条 
	 * @author dik
	 * 
	 */
	public class BuffBar extends SkinUI
	{
		private var roleId:int;
		private var goodBuffs:Vector.<BuffIcon>;
		private var badBuffs:Vector.<BuffIcon>;
		private var gridW:int;
		private var buffSp:Sprite;
		private var debuffSp:Sprite;
		
		public function BuffBar(skin:StateSkin=null)
		{
			super(skin);
		}
		
		override protected function  onShow() : void
		{
			initEvent();
			initBuff();
		}
		
		private function initBuff():void
		{
			goodBuffs=new Vector.<BuffIcon>();
			badBuffs=new Vector.<BuffIcon>();
			roleId=MainRoleManager.actor.id;
			var buffList : Vector.<BuffData>=(MainRoleManager.actor.data as RoleData).buffList;
			var num:int=buffList.length;
			gridW=IcoSizeEnum.ICON_36+5;
			buffSp=new Sprite();
			debuffSp=new Sprite();
			this.addChild(buffSp);
			this.addChild(debuffSp);
			for(var i:int=0;i<num;i++){
				var data:BuffData=buffList[i];
				createIcon(data);
			}
		}
		
		private function createIcon(data:BuffData):void
		{
			if(data.buffData.q_icon_show==0){
				return;
			}
			var icon:BuffIcon=BuffIcon.create(IcoSizeEnum.ICON_36);
			icon.buffData=data;
			var xx:int;
			if(data.buffData.q_effect_type==2){//负面
				if(badBuffs.length==0){
					xx=0;
				}else{
					xx=badBuffs[badBuffs.length-1].x+gridW;
				}
				icon.x=xx;
				badBuffs.push(icon);
				debuffSp.addChild(icon);
			}else{
				if(goodBuffs.length==0){
					xx=-1*gridW;
				}else{
					xx=goodBuffs[goodBuffs.length-1].x-gridW;
				}
				icon.x=xx;
				goodBuffs.push(icon);
				buffSp.addChild(icon);
			}
			
			var lostTim:int=CDDataManager.getCdNowTm(getKey(data.buffData.q_buff_id));
			CDDataManager.playCD(getKey(data.buffData.q_buff_id), data.buffData.q_effect_time, lostTim);
			
			resize(Starling.current.stage.stageWidth, Starling.current.stage.stageHeight);
		}
		
		private  function getKey(id : int) : String
		{
			return FaceTypeEnum.BUFF+"_"+roleId + "_" + id;
		}
		
		private function initEvent():void
		{
			EventManager.addEvent(BuffEvent.ADD_BUFF, addBuff);
			EventManager.addEvent(BuffEvent.REMOVE_BUFF, removeBuff);
		}
		
		private function removeBuff(buffData:BuffData):void
		{
			if(buffData.roleId!=roleId){
				return;
			}
			if(buffData.buffData.q_effect_type==2){//负面
				removeForDatas(buffData,badBuffs);
			}else{
				removeForDatas(buffData,goodBuffs);
			}
		}
		
		private function removeForDatas(data:BuffData,datas:Vector.<BuffIcon>):void
		{
			var icon:BuffIcon;
			var num:int=datas.length;
			for  (var i:int=0;i<num;i++) 
			{
				icon=datas[i];
				if(icon.buffData==data){
					datas.splice(i,1);
					BuffIcon.recycle(icon);
					break;
				}
			}
			num=datas.length;
			var changW:int;
			if(datas==goodBuffs){
				changW=gridW;
			}else{
				changW=-1*gridW;
			}
			
			while(i<num){
				icon=datas[i];
				icon.x+=changW;
				i++;
			}
		}
		
		private function addBuff(buffData:BuffData):void
		{
			if(buffData.roleId!=roleId){
				return;
			}
			createIcon(buffData);
		}
		
		public function resize(w : int, h : int) : void 
		{
			this.x=(w-this.width)/2;
			this.y=h-150;
		}
	}
}