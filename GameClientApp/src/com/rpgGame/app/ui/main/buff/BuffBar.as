package com.rpgGame.app.ui.main.buff
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.view.icon.BuffIcon;
	import com.rpgGame.core.events.BuffEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.view.uiComponent.face.cd.CDDataManager;
	import com.rpgGame.coreData.clientConfig.Q_buff;
	import com.rpgGame.coreData.enum.face.FaceTypeEnum;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.buff.BuffData;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.item.GridBGType;
	
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
		private const LINEMAX:int=4;//每行最多个数
		public function BuffBar(skin:StateSkin=null)
		{
			super(skin);
		}
		
		override protected function  onShow() : void
		{
			initEvent();
			initBuff();
			
			/*
			var data:BuffData=new BuffData(10001);
			data._data=new Q_buff();
			data._data.q_action_type="[33]";
			data._data.q_buff_id=2005;
			data._data.q_cast_type=2;
			data._data.q_effect_type=1;
			data._data.q_icon_show=1;
			data._data.q_overlay=5;
			data._data.q_effect_time=-1;
			data._data.q_Bonus_skill="2021";
			data._data.q_effect_cooldown=1000;
			data.cfgId=2005;
			data.;
			
			
			
			createIcon(data);*/
		}
		
		private function initBuff():void
		{
			goodBuffs=new Vector.<BuffIcon>();
			badBuffs=new Vector.<BuffIcon>();
			roleId=MainRoleManager.actor.id;
			var buffList : Vector.<BuffData>=(MainRoleManager.actor.data as RoleData).buffList;
			var num:int=buffList.length;
			gridW=IcoSizeEnum.ICON_36+8;
			buffSp=new Sprite();
			buffSp.x=-52;
			buffSp.y=33;
			debuffSp=new Sprite();
			debuffSp.x=104;
			debuffSp.y=33;
			this.addChild(buffSp);
			this.addChild(debuffSp);
			for(var i:int=0;i<num;i++){
				var data:BuffData=buffList[i];
				createIcon(data);
			}
		}
		
		private function isCreate(data:BuffData):Boolean
		{
			var icon:BuffIcon;
			var num:int=goodBuffs.length;
			for(var i:int=0;i<num;i++){
				icon=goodBuffs[i];
				if(icon.buffData.buffData.q_buff_id==data.buffData.q_buff_id){
					return true;
				}
			}
			num=badBuffs.length;
			for(i=0;i<num;i++){
				icon=badBuffs[i];
				if(icon.buffData.buffData.q_buff_id==data.buffData.q_buff_id){
					return true;
				}
			}
			
			return false;
		}
		
		private function createIcon(data:BuffData):void
		{
			if(data.buffData.q_icon_show==0/*||isCreate(data)*/){
				return;
			}
			var icon:BuffIcon=new BuffIcon(IcoSizeEnum.ICON_36);
			icon.buffData=data;
			icon.setUrlBg("ui/mainui/shortcut/buffkuang.png");
			var xx:int;
			var length:int,line:int,row:int;
			var i:int,j:int;
			if(data.buffData.q_effect_type==2){//负面
//				if(badBuffs.length==0){
//					xx=0;
//				}else{
//					xx=badBuffs[badBuffs.length-1].x+gridW;
//				}
				//icon.x=xx;
				//badBuffs.push(icon);
				//debuffSp.addChild(icon);
				
				
				
				
				length=badBuffs.length;
				line=length%LINEMAX;
				row=int(length/LINEMAX);
				icon.x=line*gridW;
				icon.y=-row*gridW;
				badBuffs.push(icon);
				debuffSp.addChild(icon);
			}else{
//				if(goodBuffs.length==0){
//					xx=-1*gridW;
//				}else{
//					xx=goodBuffs[goodBuffs.length-1].x-gridW;
//				}
				//icon.x=xx;
				
				//icon.x=0;
				//icon.y=0;
				length=goodBuffs.length;
				line=length%LINEMAX;
				row=int(length/LINEMAX);
				icon.x=-line*gridW;
				icon.y=-row*gridW;
				goodBuffs.push(icon);
				buffSp.addChild(icon);
			}
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
				if(icon.buffData.buffData.q_buff_id==data.buffData.q_buff_id){
					datas.splice(i,1);
					icon.dispose();
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
			
			for(var i:int=0;i<1;i++)
			{
				createIcon(buffData);
			}
			
			
			
		}
		
		public function resize(w : int, h : int) : void 
		{
			this.x=(w-this.width)/2;
			this.y=h-150;
		}
	}
}