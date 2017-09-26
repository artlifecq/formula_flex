package com.rpgGame.appModule.skill
{
	import com.game.engine3D.display.InterObject3D;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.sender.SpellSender;
	import com.rpgGame.app.view.icon.BgIcon;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.SpellDataManager;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.clientConfig.Q_item;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.lang.LangSpell;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.type.EffectUrl;
	import com.rpgGame.coreData.type.TipType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	import com.rpgGame.netData.skill.bean.SkillInfo;
	
	import feathers.controls.Label;
	import feathers.utils.filter.GrayFilter;
	
	import gs.TweenMax;
	import gs.easing.Expo;
	
	import org.mokylin.skin.app.wuxue.jineng.jineng_jinjie;
	
	import starling.display.DisplayObject;
	
	/**
	 *技能升阶 
	 * @author dik
	 * 
	 */
	public class SkillRiseView
	{
		private var skin:jineng_jinjie;
		private var _icon:BgIcon;
		private var cfg:Q_skill_model;
		private var _riseIcon:BgIcon;
		private var labelList:Vector.<Label>;
		private var cacheLb:Vector.<Label>;
		private var _panel:SkinUI;
		
		public function SkillRiseView(_skin:jineng_jinjie,panel:SkinUI)
		{
			_panel=panel;
			_icon=new BgIcon(IcoSizeEnum.ICON_64);
			_icon.touchable=false;
			_riseIcon=new BgIcon(IcoSizeEnum.ICON_64);
			_riseIcon.touchable=false;
			skin=_skin;
			skin.container.addChild(_icon);
			skin.container.addChildAt(_riseIcon,12);
			_icon.bindBg(_skin.Icon_jineng);
			_riseIcon.bindBg(_skin.Icon_jineng2);
			skin.lb_yinliang.wordWrap=false;
			skin.lb_daoju.wordWrap=false;
			labelList=new Vector.<Label>();
			MCUtil.removeSelf(_skin.lb_daoju1);
		}
		
		public function unlock():void
		{
			_panel.playInter3DAt(ClientConfig.getEffect(EffectUrl.UI_JINJIE_UNLOCK),620,260,1,playComplete,addEft);
			TweenMax.to(	skin.Icon_lock,0.5,{alpha:0,ease:Expo.easeOut,onComplete:playCompleteTween});
		}
		
		private function addEft(render:RenderUnit3D):void
		{
			render.play(0);
		}
		
		private function playCompleteTween():void
		{
			skin.Icon_lock.alpha=1;
			skin.Icon_lock.visible=false;
			GrayFilter.unGray(_riseIcon);
		}
		
		private function playComplete(target:InterObject3D):void
		{
			target.removeFromParent();
		}
		
		public function update(selectedCfg:Q_skill_model, selectedInfo:SkillInfo):void
		{
			cfg=selectedCfg;
			skin.lb_name.text=selectedCfg.q_skillName;
			skin.lb_dengji.text=getTitleText(LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT1),selectedInfo?selectedInfo.skillLevel:0+"/"+cfg.q_max_grade);
			skin.lb_leixing.text=getTitleText(LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT6),selectedCfg.q_type_description);
			skin.lb_xiaohao.text=getTitleText(LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT5),cfg.q_recovers_detail.length==0?LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT12):cfg.q_recovers_detail);
			skin.lb_lengque.text=getTitleText(LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT4),selectedCfg.q_cd/1000);
			
			
			_icon.setIconResName(ClientConfig.getSkillIcon(selectedCfg.q_skillID.toString(),IcoSizeEnum.ICON_64));
			_riseIcon.setIconResName(ClientConfig.getRiseSkillIcon(selectedCfg.q_skillID.toString(),IcoSizeEnum.ICON_64));
			_riseIcon.filter=null;
			_riseIcon.visible=true;
			if(selectedInfo&&selectedInfo.skillLevel==cfg.q_max_grade){
				skin.Icon_lock.visible=false;
				GrayFilter.unGray(_riseIcon);
			}else{
				GrayFilter.gray(_riseIcon);
				skin.Icon_lock.visible=true;
				//不知为何灰度之后需要设置下宽高才能显示正常
				_riseIcon.width=100;
				_riseIcon.height=100;
			}
			
			
			GrayFilter.unGray(skin.btn_jinjie);
			skin.btn_jinjie.touchable=true;
			
			var riseData:Q_skill_model=SpellDataManager.getSpellData(selectedCfg.q_skillID,2);
			if(!riseData){
				skin.Icon_lock.visible=false;
				skin.eft_name.visible=false;
				skin.lb_name2.visible=false;
				skin.lb_jihuo.visible=false;
				skin.lb_weijihuo.visible=false;
				skin.lb_miaoshu.visible=false;
				skin.grp_tiaojian.visible=false;
				skin.btn_jinjie.visible=false;
				skin.Icon_jineng2.visible=false;
				skin.uiOk.visible=true;
				_riseIcon.visible=false;
				return;
			}
			skin.Icon_lock.visible=true;
			skin.eft_name.visible=true;
			skin.lb_name2.visible=true;
			skin.lb_jihuo.visible=true;
			skin.lb_weijihuo.visible=true;
			skin.lb_miaoshu.visible=true;
			skin.grp_tiaojian.visible=true;
			skin.btn_jinjie.visible=true;
			skin.Icon_jineng2.visible=true;
			skin.uiOk.visible=false;
			
			cacheLb=labelList;
			var i:int;
			for(i=0;i<labelList.length;i++){
				skin.grp_tiaojian.removeChild(labelList[i]);
				TipTargetManager.remove(labelList[i]);
			}
			labelList.length=0;
			
			
			skin.lb_name2.text=riseData.q_skillName;
			skin.lb_miaoshu.text=riseData.q_skillpanel_description2;
			skin.lb_miaoshu.isHtmlText=true;
			skin.lb_miaoshu.clearCacheSize();
			if(selectedInfo&&selectedInfo.skillLevel==cfg.q_max_grade){
				skin.lb_jihuo.visible=true;
				skin.Icon_lock.visible=false;
				skin.grp_tiaojian.visible=false;
				skin.btn_jinjie.visible=false;
				skin.lb_weijihuo.visible=!skin.lb_jihuo.visible;			
				//				skin.lb_jihuo.x=skin.lb_weijihuo.x=skin.lb_name2.x+skin.lb_name2.textWidth+5;
				return;
			}else{
				skin.lb_jihuo.visible=false;
				skin.lb_weijihuo.visible=!skin.lb_jihuo.visible;			
				//				skin.lb_jihuo.x=skin.lb_weijihuo.x=skin.lb_name2.x+skin.lb_name2.textWidth+5;
			}
			
			var myLv:int=MainRoleManager.actorInfo.totalStat.level;
			var myMp:Number=MainRoleManager.actorInfo.curZhenqi;
			var myMon:Number=MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_BIND_MONEY)+ MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_MONEY);
			var needLv:int=riseData.q_level_up;
			var needMp:int=riseData.q_energy_up;
			var needMon:int=riseData.q_cost_up;
			var needSkill:int=riseData.q_need_skill_level;
			
			skin.eft_name.visible=true;
			skin.lb_renwudengji.visible=false;
			skin.lb_jinengdengji.visible=false;
			if(needLv!=0){
				
				var playerStr:String=needLv+LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT21);
				if(needLv>myLv){
					GrayFilter.gray(skin.btn_jinjie);
					skin.btn_jinjie.touchable=false;
					playerStr=HtmlTextUtil.getTextColor(StaticValue.RED_TEXT,needLv.toString()+LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT21));
				}
				
				skin.lb_renwudengji.htmlText=getTitleText(LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT10),playerStr);
				skin.lb_renwudengji.visible=true;
				if(needSkill!=0){
					skin.lb_jinengdengji.visible=true;
					if(selectedInfo&&needSkill>selectedInfo.skillChildLv){
						GrayFilter.gray(skin.btn_jinjie);
						skin.btn_jinjie.touchable=false;
						playerStr=HtmlTextUtil.getTextColor(StaticValue.RED_TEXT,needSkill.toString()+LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT21));
					}else{
						playerStr=HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT,needSkill.toString()+LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT21));
					}
					skin.lb_jinengdengji.htmlText=getTitleText(LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT19),playerStr);
				}
			}else{
				skin.lb_jinengdengji.visible=true;
				if(selectedInfo&&needSkill>selectedInfo.skillChildLv){
					GrayFilter.gray(skin.btn_jinjie);
					skin.btn_jinjie.touchable=false;
					playerStr=HtmlTextUtil.getTextColor(StaticValue.RED_TEXT,needSkill.toString()+LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT21));
				}else{
					playerStr=HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT,needSkill.toString()+LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT21));
				}
				skin.lb_jinengdengji.htmlText=getTitleText(LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT19),playerStr);
			}
			
			
			skin.lb_zhenqi.htmlText=getTitleText(LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT8),needMp,myMp);
			skin.lb_yinliang.htmlText=getTitleText(LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT7),needMon,myMon);
			var w:int;
			w=skin.lb_renwudengji.textWidth+skin.lb_jinengdengji.textWidth+20;
			w=w>skin.lb_zhenqi.textWidth?w:skin.lb_zhenqi.textWidth;
			w=w>skin.lb_yinliang.textWidth?w:skin.lb_yinliang.textWidth;
			
			if(riseData.q_need_items&&riseData.q_need_items.length!=0){
				var items:Array=JSON.parse(riseData.q_need_items) as Array;//[{"mod":9017,"num":1}]
				var itemDes:Array=[];
				var obj:Object;
				for(i=0;i<items.length;i++){
					obj=items[i];
					var item:Q_item=ItemConfig.getQItemByID(obj.mod);
					itemDes.push({id:obj.mod,name:item.q_name,num:obj.num,max:BackPackManager.instance.getItemCount(obj.mod)});
				}
				
				var lb:Label;
				for(i=0;i<itemDes.length;i++){
					obj=itemDes[i];
					lb=getItemTextLine(obj);
					skin.grp_tiaojian.addChild(lb);
					lb.y=skin.lb_daoju.y+i*(skin.lb_daoju.height+5);
					w=w>lb.textWidth+80?w:lb.textWidth+80;
				}
			}
			
			
			//			var xx:int=(330-w)/2;
			//			if(skin.lb_renwudengji.visible){
			//				skin.lb_renwudengji.x=xx;
			//				if(skin.lb_jinengdengji.visible){
			//					skin.lb_jinengdengji.x=xx+20;
			//				}
			//			}else{
			//				skin.lb_jinengdengji.x=xx;
			//			}
			//			
			//			skin.lb_zhenqi.x=xx;
			//			skin.lb_yinliang.x=xx;
			//			skin.lb_daoju.x=xx;
			for(i=0;i<itemDes.length;i++){
				lb=labelList[i];
				lb.x=skin.lb_daoju.x+skin.lb_daoju.width-10;
			}
		}
		
		
		private function getItemTextLine(obj:Object):Label
		{
			var lb:Label=getLb();
			lb.color=ItemConfig.getItemQualityColor(obj.id);
			lb.htmlText=HtmlTextUtil.underLine(obj.name);
			lb.htmlText+=getItemText(obj.num,obj.max);
			lb.width=lb.textWidth+20;
			var itemInfos:Vector.<ClientItemInfo>=BackPackManager.instance.getBagItemsByID(obj.id);
			var itemInfo:ClientItemInfo;
			if(itemInfos.length>0){
				itemInfo=itemInfos[0];
			}else{
				itemInfo=new ClientItemInfo(obj.id);
				itemInfo.itemInfo=new ItemInfo();
			}
			
			TipTargetManager.show( lb, TargetTipsMaker.makeTips( TipType.ITEM_TIP, itemInfo ) );
			labelList.push(lb);
			return lb;
		}
		
		private function getLb():Label
		{
			var lb:Label;
			if(cacheLb&&cacheLb.length>0){
				lb=cacheLb.pop();
			}else{
				lb=new Label();
			}
			return lb;
		}
		
		private function getItemText(v1:int,v2:int):String
		{
			var c:uint=StaticValue.YELLOW_TEXT;
			if(v1>v2){
				c=StaticValue.RED_TEXT;
				GrayFilter.gray(skin.btn_jinjie);
				skin.btn_jinjie.touchable=false;
			}else{
				c=StaticValue.GREEN_TEXT;
			}
			return HtmlTextUtil.getTextColor(c,"("+v1+"/"+v2+")");
		}
		
		private function getTitleText(title:String,value:*,value1:Number=-1):String
		{
			var wu:String=LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT12);
			if(value is int){
				if(value==0){
					value=wu;
				}
			}
			if(title==LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT4)&&value!=wu){
				value+="s";
			}
			if(value1==-1){
				return title+":"+value;
			}
			var des:String="";
			if(value<=value1){
				des=HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT,value1+"/"+value);
			}else{
				des=HtmlTextUtil.getTextColor(StaticValue.RED_TEXT,value1+"/"+value);
				GrayFilter.gray(skin.btn_jinjie);
				skin.btn_jinjie.touchable=false;
			}
			return title+":"+des;
		}
		
		public function onTouchTarget(target:DisplayObject):Boolean
		{
			switch(target){
				case skin.btn_jinjie:
					SpellSender.reqSkillLevelUp(cfg.q_skillID,1,0);
					return true;
			}
			return false;
		}
		
		public function onHide():void
		{
			// TODO Auto Generated method stub
			
		}
	}
}