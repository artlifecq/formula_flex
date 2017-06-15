package com.rpgGame.appModule.activety.boss
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.coreData.cfg.active.ActivetyDataManager;
	import com.rpgGame.coreData.cfg.active.BossActInfo;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	import com.rpgGame.netData.monster.message.SCWorldBossResultMessage;
	
	import org.mokylin.skin.app.activety.shijieboss.TiaoZhanShengLi;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	/**
	 *挑战世界boss成功 
	 * @author dik
	 * 
	 */
	public class BossFightSuccessPanel extends SkinUIPanel
	{
		private var _skin:TiaoZhanShengLi;
		private var _gridList:Vector.<IconCDFace>;
		
		public function BossFightSuccessPanel()
		{
			_skin=new TiaoZhanShengLi();
			super(_skin);
			_gridList=new Vector.<IconCDFace>();
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			var msg:SCWorldBossResultMessage=data;
			var rank:int=msg.rank;
			var bossActInfo:BossActInfo=ActivetyDataManager.getActInfoById(msg.activityId) as BossActInfo;
			var rewards:Array=bossActInfo.getRankReward(rank);
			_skin.numPaiming.label=rank.toString();
			var icon:IconCDFace;
			for(var i:int=0;i<rewards.length;i++){			
				icon=IconCDFace.create(IcoSizeEnum.ICON_48);
				_gridList.push(icon);
				_skin.grpIcon.addChild(icon);
				icon.x=i*60;
				var itemInfo:ClientItemInfo=new ClientItemInfo(rewards[i].mod);
				itemInfo.itemInfo=new ItemInfo();
				itemInfo.itemInfo.isbind=rewards[i].bind;
				FaceUtil.SetItemGrid(icon,itemInfo);
			}
		}
		
		override public function hide():void
		{
			super.hide();
			var icon:IconCDFace;
			while(_gridList.length>0){
				icon=_gridList.pop();
				icon.destroy();
			}
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if(target==_skin.btnOk){
				this.hide();
			}
		}
	}
}