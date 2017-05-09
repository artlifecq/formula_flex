package   com.rpgGame.app.ui.main.team
{
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.TeamManager;
	import com.rpgGame.appModule.social.team.mediator.PlayerMediator;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.GameColorUtil;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.cfg.ClientSceneCfgData;
	import com.rpgGame.coreData.enum.JobEnum;
	import com.rpgGame.coreData.type.AssetUrl;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.netData.team.bean.TeamMemberInfo;
	
	import feathers.controls.UIAsset;
	
	import org.mokylin.skin.mainui.head.head_min_Skin;
	
	import starling.display.DisplayObject;



	
	public class TeamBarListItemExt extends SkinUI
	{
		
		private var _data:TeamMemberInfo;
		private var _skin:head_min_Skin;
		private var _headImg:UIAsset;
		private var tipData:Array=["未知","未知",0,0];
		public function TeamBarListItemExt()
		{
			_skin=new head_min_Skin();
			super(_skin);
			
			_headImg=new UIAsset();
			_headImg.x=10;
			_headImg.y=8;
			_skin.container.addChildAt(_headImg,3);
			var str:String="所在地图：$<br>";
			str+="等级：$<br>"+"气血：$/$";
			TipTargetManager.show(this,TargetTipsMaker.makeSimplePropChangeTextTips(str,tipData));
		}	
		
		public function setData(team:*):void
		{
			this._data=team as TeamMemberInfo;
		
			var job:int=data.appearanceInfo.job;
			_skin.UI_bing.visible=job==JobEnum.ROLE_1_TYPE;
			_skin.UI_yi.visible=job==JobEnum.ROLE_4_TYPE;
			_skin.UI_mo.visible=job==JobEnum.ROLE_2_TYPE||JobEnum.ROLE_3_TYPE;
			
			switch(job){
				case JobEnum.ROLE_1_TYPE:
					_headImg.styleName=AssetUrl.HEAD_ICON_1;
					break;
				case JobEnum.ROLE_2_TYPE:
					_headImg.styleName=AssetUrl.HEAD_ICON_2;
					break;
				case JobEnum.ROLE_3_TYPE:
					_headImg.styleName=AssetUrl.HEAD_ICON_3;
					break;
				case JobEnum.ROLE_4_TYPE:
					_headImg.styleName=AssetUrl.HEAD_ICON_4;
					break;
			}
			updateDynamic(_data.maxhp,_data.memberName,data.memberLevel,null);
		}
		public function updateDynamic(hp:int,name:String,lv:int,buff:Vector.<int>):void
		{
			_skin.role_name.text=name+" ("+lv+"级)";
			_skin.qizi.visible=_data.memberId.EqualTo(Mgr.teamMgr.captain.memberId);
			var scaleX:Number=hp/_data.maxhp;
			scaleX=scaleX>1?1:scaleX;
			_skin.xuecao_bar.scaleX=scaleX;
			tipData[0]=ClientSceneCfgData.getSceneInfo( _data.memberMapModelID ).q_map_name;
			tipData[1]=_data.memberName;
			tipData[2]=hp;
			tipData[3]=_data.maxhp;
		}
		
		public function get data():TeamMemberInfo
		{
			return _data;
		}
		override public function dispose():void
		{
			super.dispose();
			_data=null;
			TipTargetManager.remove(this);
		}
	}
}