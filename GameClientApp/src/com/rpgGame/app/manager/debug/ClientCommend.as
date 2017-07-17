package   com.rpgGame.app.manager.debug
{	
	import com.game.engine3D.manager.Stage3DLayerManager;
	import com.game.engine3D.utils.StatsUtil;
	import com.game.mainCore.core.manager.LayerManager;
	import com.gameClient.log.GameLog;
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.fight.spell.SkillAddPop;
	import com.rpgGame.app.fight.spell.SpellHitHelper;
	import com.rpgGame.app.graphics.HeadFace;
	import com.rpgGame.app.manager.ActivetyDataManager;
	import com.rpgGame.app.manager.FangChenMiManager;
	import com.rpgGame.app.manager.FunctionOpenManager;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.PKMamager;
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.app.manager.chat.ChatManager;
	import com.rpgGame.app.manager.fight.FightFaceHelper;
	import com.rpgGame.app.manager.fightsoul.FightSoulManager;
	import com.rpgGame.app.manager.hint.FloatingText;
	import com.rpgGame.app.manager.pop.UIPopManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.SceneRoleManager;
	import com.rpgGame.app.richText.RichTextCustomLinkType;
	import com.rpgGame.app.richText.RichTextCustomUtil;
	import com.rpgGame.app.state.role.RoleStateUtil;
	import com.rpgGame.app.state.role.control.SpriteUpBuffStateReference;
	import com.rpgGame.app.state.role.control.VipBuffStateReference;
	import com.rpgGame.app.ui.main.dungeon.JiXianTiaoZhanExtPop;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.active.ActivetyCfgData;
	import com.rpgGame.coreData.cfg.active.ActivetyInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.coreData.role.GirlPetData;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.type.RoleStateType;
	import com.rpgGame.coreData.type.chat.EnumChatChannelType;
	import com.rpgGame.netData.backpack.bean.TempItemInfo;
	import com.rpgGame.netData.map.bean.PetInfo;
	import com.rpgGame.netData.player.message.SCNonagePromptMessage;
	import com.rpgGame.netData.skill.bean.SkillInfo;
	import com.rpgGame.netData.vip.bean.VipCardInfo;
	import com.rpgGame.netData.vip.message.SCVipDataMessage;
	import com.rpgGame.netData.yaota.bean.YaoTaInfo;
	import com.rpgGame.netData.yaota.message.SCYaoTaAwardMessage;
	
	import org.client.mainCore.ds.HashMap;
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.data.long;
	import org.game.netCore.net.MessageMgr;
	
	
	/**
	 * 客户端命令
	 * @author ty
	 */
	public class ClientCommend
	{
		private static var ins:ClientCommend=new ClientCommend();
		private static var _isDevelop:Boolean;
		public function ClientCommend():void
		{
			initCommend();
			_isDevelop=MessageMgr.Ins.ip.indexOf("192.168")!=-1||MessageMgr.Ins.ip.indexOf("127.0.0.1");
		}
		
		private  var commandList:com.gameClient.utils.HashMap = new com.gameClient.utils.HashMap();
		private  var docommandList:Vector.<String> = new Vector.<String>;
		
		
		public  function initCommend():void 
		{
			commandList.put( ".hidestate", function (...arg):void
			{
				LayerManager.showOrHideMM();
				StatsUtil.hideAwayStats();
				
			});
			commandList.put( ".showstate", function (...arg):void
			{
				LayerManager.showOrHideMM();
				StatsUtil.showAwayStats(Stage3DLayerManager.stage,Stage3DLayerManager.stage3DProxy);
			});
			commandList.put( ".vip", function (...arg):void
			{
				var msg:SCVipDataMessage=new SCVipDataMessage();
				msg.curVipId=arg[0];
				msg.remain=arg[1];
				if (arg.length>2) 
				{
					var len:int=arg[2];
					for (var i:int = 0; i < len; i++) 
					{
						var card:VipCardInfo=new VipCardInfo();
						card.vipId=i+1;
						card.count=Math.random()*2;
						msg.cardInfos.push(card);
					}
				}
				Mgr.vipMgr.recVipPanelData(msg);
			});
			commandList.put( ".pk", function (...arg):void
			{
				MainRoleManager.actorInfo.pkMode=arg[0];
				PKMamager.setPkMode(arg[0]);
				
			});
			commandList.put( ".fight", function (...arg):void
			{
				
				SpellHitHelper.bool=!SpellHitHelper.bool;
			});
			commandList.put( ".attr", function (...arg):void
			{
				
				var hash:org.client.mainCore.ds.HashMap=new org.client.mainCore.ds.HashMap();
				hash.add(1,1000);
				hash.add(2,2000);
				hash.add(3,-1000);
				hash.add(4,-2023);
				hash.add(10,1333);
				hash.add(15,14444);
				hash.add(16,-302222);
				FightFaceHelper.showPlayerBaseAttrChange(hash);
			});
			commandList.put( ".lvup", function (...arg):void
			{
				var data:Object={};
				data.sys=arg[0];
				data.desc=arg[1];
				data.btnText=arg[2];
				EventManager.dispatchEvent(MainPlayerEvent.SYS_CAN_LEVEL_UP,data);
			});
			commandList.put( ".skill", function (...arg):void
			{
				var skill:SkillInfo=new SkillInfo();
				skill.skillModelId=arg[0];
				skill.skillLevel=1;
				skill.skillChildLv=1;
				skill.skillExp=2;
				UIPopManager.showAlonePopUI(SkillAddPop,skill);
			});
			commandList.put( ".jz", function (...arg):void
			{
				SceneRoleManager.getInstance().onUpdateNeedle(MainRoleManager.actor,arg[0],arg[1]);
			});
			commandList.put( ".bat", function (...arg):void
			{
				AppManager.showApp(AppConstant.BATTLE_MAIN_PANEL,null,"325");
			});
			commandList.put( ".bat2", function (...arg):void
			{
				AppManager.showApp(AppConstant.BATTLE_MAIN_PANEL,null,"320");
			});
			commandList.put( ".log", function (...arg):void
			{
				GameLog.enableTrace=false;
			});
			commandList.put( ".fangchenmi", function (...arg):void
			{
				var msg:SCNonagePromptMessage=new SCNonagePromptMessage();
				msg.type=parseInt(arg[0]);
				FangChenMiManager.OnSCNonagePromptMessage(msg);
			});		
			commandList.put( ".qiuhun", function (...arg):void
			{
				var str:String=ItemUtil.getJobName(MainRoleManager.actorInfo.job)+" "+MainRoleManager.actorInfo.totalStat.getStatValue(CharAttributeType.LV)+"级,"
				if(MainRoleManager.actorInfo.sex==1) str+="玉树临风胜潘安，一树梨花压海棠，求美女老婆一枚";
				else str+="小萝莉，娇羞藏，声音甜美本领强，求帅哥老公一枚";
				var link:String=RichTextCustomUtil.getTextLinkCode("点击向我求婚",StaticValue.A_UI_GREEN_TEXT,RichTextCustomLinkType.QIUHUN,MainRoleManager.actorInfo.name);		
				ChatManager.reqSendChat( str+link, EnumChatChannelType.CHAT_CHANNEL_WORLD,  ChatManager.currentSiLiaoTargetName );
			});		
			commandList.put( ".jixianjiesuan", function (...arg):void
			{
				UIPopManager.showAlonePopUI(JiXianTiaoZhanExtPop);
			});	
			commandList.put( ".df", function (...arg):void
			{
				Mgr.d1v1Mgr.autoJoin();
			});
			commandList.put( ".head", function (...arg):void
			{
				(MainRoleManager.actor.headFace as HeadFace).updateTowerFlag(arg[0]==1);
			});
			commandList.put( ".yt", function (...arg):void
			{
				var msg:SCYaoTaAwardMessage=new SCYaoTaAwardMessage();
				msg.myYaoTaInfo=new YaoTaInfo();
				for (var i:int = 0; i < arg[0]; i++) 
				{
					var tmp:TempItemInfo=new TempItemInfo();
					tmp.mod=1;
					tmp.num=100;
					msg.tempItems.push(tmp);
				}
				AppManager.showApp(AppConstant.BATTLE_NINE_TOWER_RESULT_PANEL,msg);
			});
			commandList.put( ".fightsoul", function (...arg):void
			{
				var level:int = arg[0];
				FightSoulManager.instance().updateMode(level);
			});
			commandList.put( ".actopen", function (...arg):void
			{
				var info:ActivetyInfo=ActivetyCfgData.getActInfoById(arg[0]); 
				if(info.actCfg.q_show_notice==1){
					AppManager.showAppNoHide(AppConstant.ACTIVETY_OPEN,info);
				}
			});
			
			commandList.put( ".acts", function (...arg):void
			{
				var id:int = arg[0];
				var state:int = arg[1];
				ActivetyDataManager.setActState(id,state,30);
			});
			commandList.put( ".showom", function (...arg):void
			{
				FunctionOpenManager.needShowOpenMode = arg[0]==1;
			});
			commandList.put( ".server", function (...arg):void
			{
				FloatingText.showUp(MessageMgr.Ins.ip);
			});
			commandList.put( ".sprite", function (...arg):void
			{
				if (MainRoleManager.actor.stateMachine.isSpriteUp) 
				{
					MainRoleManager.actor.stateMachine.removeState(RoleStateType.CONTROL_BUFF_SPRITEUP);
				}
				else
				{
					var buffRef:SpriteUpBuffStateReference = MainRoleManager.actor.stateMachine.getReference(SpriteUpBuffStateReference) as SpriteUpBuffStateReference;
					MainRoleManager.actor.stateMachine.transition(RoleStateType.CONTROL_BUFF_SPRITEUP,buffRef);
				}
			});
			commandList.put( ".pet", function (...arg):void
			{
				AppManager.showApp(AppConstant.PET_PANLE);
//				var mod:int = arg[0];
//				
//				var petInfo:PetInfo=new PetInfo();
//				petInfo.petId=new long(9999);
//				petInfo.ownerId=(MainRoleManager.actor.data as HeroData).serverID;
//				petInfo.petModelId=mod;
//				petInfo.x=MainRoleManager.actor.pos.x;
//				petInfo.y=-MainRoleManager.actor.pos.y;
//				var data:GirlPetData=new GirlPetData();
//				data.setServerData(petInfo);
//				SceneRoleManager.getInstance().createGirlPet(data);
			});
			commandList.put( ".sset", function (...arg):void
			{
				TrusteeshipManager.getInstance().autoSkillCtrl.resetSkill();
			});
			
		}
		
		
		public static function doCommand(str:String):Boolean 
		{
			if (!_isDevelop) 
			{
				return false;
			}
			str=str.toLowerCase();
			if (str == null || str.length <2)
				return false;
			
			if (str.charAt(0) == '。')
				str = str.replace('。', '.');
			
			if (str.charAt(0) != '.')
				return false;
			
			var boadd2list:Boolean=true;
			var i:int;
			if (str.charAt(1) == '-')
			{
				boadd2list=false;
				str=str.substr(1);
				i=parseInt(str);
				if(i==0)i=-1;
				i=ins.docommandList.length+i;
				if( i>=0 && i<ins.docommandList.length )
				{
					//Mgr.mainBottomMgr.mainBottomPanel.editInput.text = docommandList[i];
					str=ins.docommandList[i];
				}else{
					return false;
				}
			}
			
			var cmdArray:Array = str.split(" ");
			var param:Array = [];
			for ( i = 0; i < 10; i++)
			{
				param[i] = (cmdArray.length > (i + 1)) ? cmdArray[i + 1] : "";
			}
			
			var func:Function = ins.commandList.get(cmdArray[0]) as Function;
			if (func != null) {
				//				if(boadd2list){
				//					if( docommandList.indexOf(str)<0 && (cmdArray[0]!=".sscmd") && (cmdArray[0]!=".clearc") ){
				//						docommandList.push(str);
				//						Mgr.cache.data["docommandList"]=docommandList;
				//						Mgr.flushCache();
				//					}
				//				}
				func(param[0], param[1], param[2], param[3], param[4], param[5], param[6], param[7], param[8], param[9]);
				return true;
			}
			
			return false;
		}
	}
}
