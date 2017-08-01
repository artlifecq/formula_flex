package com.rpgGame.app.ui.tips.cheats
{
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.view.icon.BgIcon;
	import com.rpgGame.core.events.CheatsEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.AttrUtil;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	import com.rpgGame.coreData.cfg.BuffStateDataManager;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.cheats.CheatsCfg;
	import com.rpgGame.coreData.clientConfig.Q_buff;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.cheats.CheatsVo;
	import com.rpgGame.coreData.type.CharAttributeType;
	
	import flash.geom.Point;
	
	import feathers.controls.Label;
	
	import org.mokylin.skin.app.beibao.Xinfa.Xinfa_Tips2;
	
	import starling.display.DisplayObject;

	public class CheatsTipExt extends SkinUI implements ITip
	{
		private static var _instance : CheatsTipExt = null;
		
		public static function get instance() : CheatsTipExt
		{
			if (!_instance)
			{
				_instance = new CheatsTipExt();
			}
			return _instance;
		}
		private var _skin:Xinfa_Tips2;
		private var labList:Array;
		private var _skillIcon:BgIcon;
		private var _chacheData:*;
		public function CheatsTipExt()
		{
			_skin=new Xinfa_Tips2();
			super(_skin);
			MCUtil.removeSelf(_skin.lab_shuxing);
			MCUtil.removeSelf(_skin.lab_xiangsheng);
			MCUtil.removeSelf(_skin.line5);
			MCUtil.removeSelf(_skin.lab_shuoming);
			MCUtil.removeSelf(_skin.lab_Ctrl);
			_skillIcon=new BgIcon(IcoSizeEnum.ICON_36);
			_skillIcon.x=4;
			_skillIcon.y=4;
			_skin.gridSkill.addChild(_skillIcon);
			labList=[];
			Mgr.cheatsMgr.addEventListener(CheatsEvent.CHEATS_TIP_CHANGE,onDataChange);
		}
		
		protected function onDataChange(event:CheatsEvent):void
		{
			// TODO Auto-generated method stub
			if (event.data==_chacheData) 
			{
				setTipData(event.data);
			}
		}
		
		public function setTipData(data:*):void
		{
			var cheatVo:CheatsVo=data.cheatsVo as CheatsVo;
			_chacheData=data;
			if (cheatVo) 
			{
				for each (var dis:DisplayObject in labList) 
				{
					MCUtil.removeSelf(dis);
				}
				labList.length=0;
				
				//名字
				_skin.lab_name.text=cheatVo.cheatsConfig.q_name;
				var lab:Label;
				//状态
				if (cheatVo.level==0) 
				{
					_skin.lab_jihuo.visible=true;
					_skin.mcLevel.visible=false;
				}
				else
				{
					_skin.lab_jihuo.visible=false;
					_skin.mcLevel.visible=true;
					_skin.mcLevel.gotoAndStop(cheatVo.level+"");
				}
				var starty:int=_skin.mcLevel.y+_skin.mcLevel.height+8;
				var startPos:Point=new Point(11,starty);
//				//属性
//				if (cheatVo.level>0) 
//				{					
//					labList=labList.concat(AttrUtil.showAttr(cheatVo.totalValue,this,_skin.lab_shuxing,2,startPos,_skin.lab_shuxing.width,_skin.lab_shuxing.height+2,":"));
//					starty=startPos.y;
//				}
//				starty+=10;			
				if (cheatVo.extendAttr.size()>0) 
				{
					_skin.line2.visible=true;
					_skin.line2.y=starty;
					starty+=_skin.line2.height+5;
					_skin.imgJiHuoTitle.visible=true;
					//激活属性
					_skin.imgJiHuoTitle.y=starty;
					starty+=_skin.imgJiHuoTitle.height+2;
					startPos.y=starty;
					//激活属性
					labList=labList.concat(AttrUtil.showAttr(cheatVo.extendAttr,this,_skin.lab_shuxing,2,startPos,120,_skin.lab_shuxing.height+2,":"));
					starty=startPos.y;
				}
				else
				{
					_skin.line2.visible=false;
					_skin.imgJiHuoTitle.visible=false;
				}
				
				//技能
				var buffObj:Array=cheatVo.getCurBuff();
				if (buffObj!=null) 
				{
					_skin.line3.visible=true;
					_skin.line3.y=starty;
					starty+=_skin.line3.height+5;
					_skin.imgSkill.visible=true;
					_skin.gridSkill.visible=true;
					_skin.imgSkill.y=starty;
					starty+=_skin.imgSkill.height+2;
					_skin.gridSkill.y=starty;
					starty+=_skin.gridSkill.height+2;
					var buff:Q_buff=BuffStateDataManager.getData(buffObj[0]);
					_skillIcon.setIconResName(ClientConfig.getBuffIcon(buff.q_icon,IcoSizeEnum.ICON_36));
				}
				else
				{
					_skin.imgSkill.visible=false;
					_skin.gridSkill.visible=false;
					_skin.line3.visible=false;
				}
								
				var keys:Array=cheatVo.careCheats.keys();
				var len:int=keys.length;
				if (len>0) 
				{
					_skin.line4.visible=true;
					_skin.line4.y=starty;
					starty+=_skin.line4.height+5;
					_skin.imgXS.visible=true;
					//相生
					_skin.imgXS.y=starty;
					starty+=_skin.imgXS.height+2;
					for (var i:int = 0; i < len; i++) 
					{
						lab=clonelab(_skin.lab_xiangsheng);
						lab.y=starty;
						var tipStr:String="与《$》相生，本心法$提升$";
						var effectArr:Array=cheatVo.careCheats.getValue(keys[i]);
						tipStr=LanguageConfig.replaceStr(tipStr,[CheatsCfg.getCheats(effectArr[0]).q_name,CharAttributeType.getCNName(effectArr[2]),(effectArr[3])]);
						lab.text=tipStr;
						starty+=lab.height+2;
						lab.height=lab.textHeight;
						this.addChild(lab);
					}
				}
				else
				{
					_skin.line4.visible=false;
					_skin.imgXS.visible=false;
				}
				//线 不要 等要的时候在启用
				
				_skin.imgBg.height=starty+10;
			}
		}
		public function hideTips():void
		{

		}
		private function clonelab(lab:Label):Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.name =lab.name;
			temp.letterSpacing = lab.letterSpacing;
			temp.text = lab.text;
			temp.color =lab.color;
			temp.nativeFilters = lab.nativeFilters;
			temp.width = lab.width;
			temp.x = lab.x;
			temp.y = lab.y;
			labList.push(temp);
			return temp;
		}
	}
}