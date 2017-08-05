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
			
		}
		
		private function initBuff():void
		{
			goodBuffs=new Vector.<BuffIcon>();
			badBuffs=new Vector.<BuffIcon>();
			roleId=MainRoleManager.actor.id;
			var buffList : Vector.<BuffData>=(MainRoleManager.actor.data as RoleData).buffList;
			var num:int=buffList.length;
			gridW=IcoSizeEnum.ICON_19+9;
			buffSp=new Sprite();
			buffSp.x=-30-gridW;
			buffSp.y=0;
			debuffSp=new Sprite();
			debuffSp.x=34;
			debuffSp.y=0;
			this.addChild(buffSp);
			this.addChild(debuffSp);
			for(var i:int=0;i<num;i++){
				var data:BuffData=buffList[i];
				if(data._data.q_effect_time!=-1)
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
					icon.buffData=data;
					return true;
				}
			}
			num=badBuffs.length;
			for(i=0;i<num;i++){
				icon=badBuffs[i];
				if(icon.buffData.buffData.q_buff_id==data.buffData.q_buff_id){
					icon.buffData=data;
					return true;
				}
			}
			
			return false;
		}
		
		private function createIcon(data:BuffData):void
		{
			if(data.buffData.q_icon_show==0||isCreate(data)){
				return;
			}
			var isShowBG:Boolean=(data.buffData.q_buff_id==9||data.buffData.q_buff_id==10);
			var icon:BuffIcon=new BuffIcon(IcoSizeEnum.ICON_19,!isShowBG);
			icon.buffData=data;
			icon.setUrlBg("ui/mainui/head/BAFF/buffBg_20.png");
			//			icon.setBg(GridBGType.GRID_SIZE_44);
			var xx:int;
			var length:int,line:int,row:int;
			var i:int,j:int;
			if(data.buffData.q_effect_type==2){//负面
				length=badBuffs.length;
				line=length%LINEMAX;
				row=int(length/LINEMAX);
				icon.x=line*gridW;
				icon.y=-row*gridW;
				badBuffs.push(icon);
				debuffSp.addChild(icon);
			}else{
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
			if(buffData.roleId!=roleId||buffData._data.q_effect_time==-1){
				return;
			}
			removeForDatas(buffData);
		}
		
		private function removeForDatas(buffData:BuffData):void
		{
			var icon:BuffIcon;
			var num:int,i:int;
			if(buffData.buffData.q_effect_type==2){//负面
				num=badBuffs.length;
				for  (i=0;i<num;i++) 
				{
					icon=badBuffs[i];
					if(icon.buffData.buffData.q_buff_id==buffData.buffData.q_buff_id){
						icon.dispose();
						badBuffs.splice(i,1);
						break;
					}
				}
				
			}else{
				num=goodBuffs.length;
				for  (i=0;i<num;i++) 
				{
					icon=goodBuffs[i];
					if(icon.buffData.buffData.q_buff_id==buffData.buffData.q_buff_id){
						icon.dispose();
						goodBuffs.splice(i,1);
						break;
					}
				}
			}
			
			
			
			/*num=datas.length;
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
			}*/
		}
		/*private function removeBuff(buffData:BuffData):void
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
		
		//icon.dispose();
		
		
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
		}*/
		
		private function addBuff(buffData:BuffData):void
		{
			if(buffData.roleId!=roleId||buffData._data.q_effect_time==-1){
				return;
			}
			
			for(var i:int=0;i<5;i++)
			{
				//createIcon(buffData);
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