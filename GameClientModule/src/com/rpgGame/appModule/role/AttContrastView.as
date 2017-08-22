package com.rpgGame.appModule.role
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.netData.player.bean.OtherFightPower;
	import com.rpgGame.netData.player.bean.OthersInfo;
	
	import org.mokylin.skin.app.beibao.VS_Skin;
	import org.mokylin.skin.app.beibao.juese_Skin;

	/**
	 *属性对比 
	 * @author dik
	 * 
	 */
	public class AttContrastView
	{
		private var _skin:juese_Skin;
		private var _vsSkin:VS_Skin;
		private var _roleData:HeroData;
		private var _mainRoleData:HeroData;
		private var _otherInfo:OthersInfo;
		public function AttContrastView(skin:juese_Skin)
		{
			_skin=skin;
			_vsSkin=skin.duibi_panel.skin as VS_Skin;
		}
		
		public function show(data:HeroData,info:OthersInfo):void
		{
			_roleData=data;
			_otherInfo=info;
			_mainRoleData=MainRoleManager.actorInfo;
			_skin.duibi_panel.visible=true;
			initView();
		}
		
		private function initView():void
		{
			_vsSkin.lb_own.text=_mainRoleData.name;
			_vsSkin.lb_other.text=_roleData.name;
			
			_vsSkin.num_own.number=getValueByData(_mainRoleData,CharAttributeType.FIGHTING);
			_vsSkin.num_other.number=getValueByData(_roleData,CharAttributeType.FIGHTING);
		
			setValue("ms",CharAttributeType.HURT_SEC);
			setValue("dj");
			setValue("zb");
			setValue("zq");
			setValue("xf");
			setValue("jn");
			setValue("jm");
			setValue("zq");
			setValue("mr");
			
		}
		
		private function getPowerByType(type:int,list:Vector.<OtherFightPower>):int
		{
			for(var i:int=list.length;i>0;i--){
				if(list[i].type==type){
					return list[i].fightPower;
				}
			}
			return 0;
		}
		
		
		private function setValue(vsName:String,type:int=-1):void
		{
			var max:int;
			var m:int;
			var o:int;
			if(type!=-1){
				m=getValueByData(_mainRoleData,type);
				o=getValueByData(_roleData,type);
			}else{
				switch(vsName){
					case "dj"://等级
					m=_mainRoleData.totalStat.level;
					o=_roleData.totalStat.level;
					break
					case "zq"://坐骑
					m=getPowerByType(1,_otherInfo.selfFightPower);
					o=getPowerByType(1,_otherInfo.otherFightPowr);
					break
					case "zb"://装备
						m=getPowerByType(2,_otherInfo.selfFightPower);
						o=getPowerByType(2,_otherInfo.otherFightPowr);
						break
					case "xf"://心法
						m=getPowerByType(3,_otherInfo.selfFightPower);
						o=getPowerByType(3,_otherInfo.otherFightPowr);;
						break
					case "jn"://技能
						m=getPowerByType(4,_otherInfo.selfFightPower);
						o=getPowerByType(4,_otherInfo.otherFightPowr);;
						break
					case "jm"://经脉
						m=getPowerByType(5,_otherInfo.selfFightPower);
						o=getPowerByType(5,_otherInfo.otherFightPowr);;
						break
					case "zq"://战旗
						m=getPowerByType(6,_otherInfo.selfFightPower);
						o=getPowerByType(6,_otherInfo.otherFightPowr);;
						break
					case "mr"://美人
						m=getPowerByType(7,_otherInfo.selfFightPower);
						o=getPowerByType(7,_otherInfo.otherFightPowr);;
						break;
				}
			}
			max=m>o?m:o;
			max=max!=0?max:100;
			updateProgress(vsName+"_own",max,m);
			updateProgress(vsName+"_other",max,o);			
		}
		
		private function getValueByData(data:HeroData,type:int):int
		{
			return data.totalStat.getStatValue(type);
		}
		
		private function updateProgress(vsName:String,max:int,value:int):void
		{
			_vsSkin["pro_"+vsName].maximum=max;
			_vsSkin["pro_"+vsName].value=value;
			_vsSkin["lb_"+vsName].text=value;
		}
		
		internal function onHide():void
		{
			_skin.duibi_panel.visible=false;
		}
	}
}