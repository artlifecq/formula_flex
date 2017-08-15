package com.rpgGame.app.ui.alert
{
	
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.manager.ItemActionManager;
	import com.rpgGame.app.manager.goods.RoleEquipmentManager;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.clientConfig.Q_item;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	
	import flash.geom.Point;
	import flash.utils.Dictionary;
	
	import app.message.EquipType;
	
	import feathers.controls.UIAsset;
	
	import gs.TweenLite;
	
	import org.game.netCore.data.long;
	import org.mokylin.skin.mainui.tishi.HuoDe_ZhuangBei2;
	
	import starling.core.Starling;
	
	public class EquipAutoDressEffectPanelExt extends SkinUIPanel
	{
		private static var _autoDressEquips:Dictionary=new Dictionary();
		private static var _ins:EquipAutoDressEffectPanelExt=null;
		private static var _lastEquips:HashMap=new HashMap();
		public static function checkShowDressEffect(equip:ItemInfo):void
		{
			if (_autoDressEquips[equip.itemId.hexValue]!=undefined) 
			{
				var start:Point= _autoDressEquips[equip.itemId.hexValue];
				delete _autoDressEquips[equip.itemId.hexValue];
				ins.stopTween();
				ins.updateEquip();
				StarlingLayerManager.topUILayer.addChild(ins);
				ins.respos();
				ins.stepShow(equip.itemModelId,start);
			}
		}
		public function test(mid:int):void
		{
			ins.updateEquip();
			StarlingLayerManager.topUILayer.addChild(ins);
			respos();
			ins.stepShow(mid,null);
			
		}
		private function respos():void
		{
			onStageResize(Starling.current.nativeStage.stageWidth,Starling.current.nativeStage.stageHeight);
		}
		override protected function onStageResize(sw:int, sh:int):void
		{
			this.x=sw/2;
			this.y=sh-180-_skin.height;
		}
		public static function addAutoDressEquip(equ:long,pos:Point):void
		{
			if (_autoDressEquips[equ.hexValue]==undefined) 
			{
				_autoDressEquips[equ.hexValue]=pos;
			}
			_lastEquips.clear();
			var equs:Array=RoleEquipmentManager.instance.goodsList;
			for each (var tequ:ClientItemInfo in equs) 
			{
				if (tequ) 
				{
					_lastEquips.put(tequ.qItem.q_kind,tequ.qItem.q_id);
				}
				
			}
			
		}
		private var _skin:HuoDe_ZhuangBei2;
		private var endPos:Point=new Point();
		private var startPos:Point=new Point();
		private var stepShowTime:Number=0.6;
		private var holdShowTime:Number=2;
		private var _equipGrid:HashMap;
		private const NUM:int=10;
		private var _flyIcon:UIAsset=new UIAsset();
		public function EquipAutoDressEffectPanelExt()
		{
			_skin=new HuoDe_ZhuangBei2();
			super(_skin);
			init();
		}
		private function init():void
		{
			this.pivotX=_skin.width/2;
			
			this.dragAble=false;
			this.escExcuteAble=false;
			_equipGrid=new HashMap();
			createGrid(EquipType.WEAPON,_skin.Icbg1);
			createGrid(EquipType.ARMOR,_skin.Icbg5);
			createGrid(EquipType.LEGHARNESS,_skin.Icbg7);
			createGrid(EquipType.SHOE,_skin.Icbg9);
			createGrid(EquipType.HELM,_skin.Icbg3);
			createGrid(EquipType.SCAPULA,_skin.Icbg0);
			createGrid(EquipType.BRACER,_skin.Icbg6);
			createGrid(EquipType.NECKLACE,_skin.Icbg4);
			createGrid(EquipType.RING,_skin.Icbg2);
			createGrid(EquipType.JADE,_skin.Icbg8);
		}
		private function createGrid(kind:int,con:UIAsset):void
		{
			var ico:IconCDFace=new IconCDFace(IcoSizeEnum.ICON_48);
			ico.bindBg(con);
			this._skin.weapons.addChild(ico);
			_equipGrid.put(kind,ico);
		}
		private function updateEquip():void
		{
			var equId:int;
			var ico:IconCDFace;
			for (var i:int = 0; i < NUM; i++) 
			{
				equId=_lastEquips.getValue(i);
				ico=_equipGrid.getValue(i);
				//为空检查上一次删除的
				if (equId==0) 
				{
					ico.clear();
				}
				else
				{
					FaceUtil.setGridData(ico,ItemUtil.convertClientItemInfoById(equId));
				}
			}
		}
		private function stepShow(mid:int,st:Point):void
		{
			var qItem:Q_item=ItemConfig.getQItemByID(mid);
			_flyIcon.styleName=ClientConfig.getItemIcon(qItem.q_icon+"",IcoSizeEnum.ICON_48);
			stopTween();
			if (st==null) 
			{
				startPos.x=Starling.current.nativeStage.stageWidth-150;
				startPos.y=Starling.current.nativeStage.stageHeight-150;
			}
			else
			{
				startPos.x=st.x;
				startPos.y=st.y;
			}
			
			_flyIcon.x=startPos.x;
			_flyIcon.y=startPos.y;
			
			var ico:IconCDFace=_equipGrid.getValue(qItem.q_kind);
			this.alpha=1;
			this.scale=1;
			var newS:Point=new Point();
			startPos.x=ico.x+4;
			startPos.y=ico.y+4;
			this._skin.weapons.localToGlobal(startPos,newS);
			StarlingLayerManager.topUILayer.addChild(_flyIcon);
			TweenLite.to(this._flyIcon,stepShowTime,{x:newS.x,y:newS.y,onComplete:stepShowComplete,onCompleteParams:[mid,ico]});
		}
		private function stopTween():void
		{
			TweenLite.killTweensOf(this);
			TweenLite.killTweensOf(this._flyIcon);
			MCUtil.removeSelf(_flyIcon);
		}
		private function stepShowComplete(...arg):void
		{
			MCUtil.removeSelf(_flyIcon);
			var p:Point=new Point(arg[1].x+arg[1].width/2,arg[1].y+arg[1].height/2);
			p=arg[1].parent.localToGlobal(p);
			p=this._skin.container.globalToLocal(p);
			this.playInter3DAt(ClientConfig.getEffect("ui_baoyixia"),p.x,p.y,0);
			TweenLite.to(this,holdShowTime,{onComplete:stepHide});
			FaceUtil.setGridData(arg[1],ItemUtil.convertClientItemInfoById(arg[0]));
		}
		private function stepHide():void
		{
			var startPos:Point=ItemActionManager.getBackPackBtnPos();
			TweenLite.to(this,stepShowTime,{x:startPos.x+30,y:startPos.y+30,alpha:0.3,scale:0,onComplete:stepHideComplete});
		}
		private function stepHideComplete():void
		{
			hide();
		}
		override protected function onHide():void
		{
			
			super.onHide();
			_equipGrid.eachValue(clearGrid);
			stopTween();
		}
		private function clearGrid(ico:IconCDFace):void
		{
			ico.clear();
		}
		
		
		
		
		
		
		
		
		public static function get ins():EquipAutoDressEffectPanelExt
		{
			if (_ins==null) 
			{
				_ins=new EquipAutoDressEffectPanelExt();
			}
			return _ins;
		}
		
	}
}