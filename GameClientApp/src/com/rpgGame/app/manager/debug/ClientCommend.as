package   com.rpgGame.app.manager.debug
{	
	import com.game.engine3D.manager.InputManger;
	import com.game.engine3D.manager.Stage3DLayerManager;
	import com.game.engine3D.scene.render.RenderSet3D;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.scene.render.vo.RenderParamData3D;
	import com.game.engine3D.utils.StatsUtil;
	import com.gameClient.log.GameLog;
	import com.gameClient.utils.HashMap;
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.display2D.ResChangeEffect;
	import com.rpgGame.app.fight.spell.FightPowerChangePopPanelExt;
	import com.rpgGame.app.fight.spell.ReleaseSpellInfo;
	import com.rpgGame.app.fight.spell.SpellAnimationHelper;
	import com.rpgGame.app.fight.spell.SpellHitHelper;
	import com.rpgGame.app.fight.spell.SpellResultTweenUtil;
	import com.rpgGame.app.fight.spell.TweenLiteUtil;
	import com.rpgGame.app.graphics.HeadBloodBar;
	import com.rpgGame.app.graphics.HeadFace;
	import com.rpgGame.app.manager.ActivetyDataManager;
	import com.rpgGame.app.manager.FangChenMiManager;
	import com.rpgGame.app.manager.FunctionOpenManager;
	import com.rpgGame.app.manager.MainUIManager;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.PKMamager;
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.app.manager.chat.ChatManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.fight.FightFaceHelper;
	import com.rpgGame.app.manager.fightsoul.FightSoulManager;
	import com.rpgGame.app.manager.hint.FloatingText;
	import com.rpgGame.app.manager.pop.UIPopManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.SceneRoleManager;
	import com.rpgGame.app.manager.role.SceneRoleSelectManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.richText.RichTextCustomLinkType;
	import com.rpgGame.app.richText.RichTextCustomUtil;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.state.role.RoleStateUtil;
	import com.rpgGame.app.state.role.control.SpriteUpBuffStateReference;
	import com.rpgGame.app.state.role.control.WalkMoveStateReference;
	import com.rpgGame.app.ui.OpenPanel;
	import com.rpgGame.app.ui.alert.EquipAutoDressEffectPanelExt;
	import com.rpgGame.app.ui.alert.ItemOpenResultShowPanelExt;
	import com.rpgGame.app.ui.main.dungeon.JiXianTiaoZhanExtPop;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.ItemEvent;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.SpellDataManager;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.active.ActivetyCfgData;
	import com.rpgGame.coreData.cfg.active.ActivetyInfo;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	import com.rpgGame.coreData.enum.BoneNameEnum;
	import com.rpgGame.coreData.enum.EmFunctionID;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.coreData.info.move.RoleMoveInfo;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.type.RenderUnitID;
	import com.rpgGame.coreData.type.RenderUnitType;
	import com.rpgGame.coreData.type.RoleStateType;
	import com.rpgGame.coreData.type.SceneCharType;
	import com.rpgGame.coreData.type.chat.EnumChatChannelType;
	import com.rpgGame.netData.backpack.bean.TempItemInfo;
	import com.rpgGame.netData.backpack.message.ResOpenCellResultMessage;
	import com.rpgGame.netData.fight.message.SCBuffSkillMessage;
	import com.rpgGame.netData.player.message.SCNonagePromptMessage;
	import com.rpgGame.netData.skill.bean.SkillInfo;
	import com.rpgGame.netData.structs.Position;
	import com.rpgGame.netData.vip.bean.VipCardInfo;
	import com.rpgGame.netData.vip.message.SCVipDataMessage;
	import com.rpgGame.netData.yaota.bean.YaoTaInfo;
	import com.rpgGame.netData.yaota.message.SCYaoTaAwardMessage;
	
	import flash.geom.Point;
	import flash.geom.Vector3D;
	import flash.utils.setTimeout;
	
	import app.message.EnumItemId;
	
	import gs.TweenLite;
	
	import org.client.mainCore.ds.HashMap;
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection;
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
			commandList.put( ".close", function (...arg):void
			{
				SocketConnection.messageMgr.testClose();
			});
			commandList.put( ".hidestate", function (...arg):void
			{
				//LayerManager.showOrHideMM();
				StatsUtil.hideAwayStats();
				
			});
			commandList.put( ".showstate", function (...arg):void
			{
				//LayerManager.showOrHideMM();
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
				//UIPopManager.showAlonePopUI(SkillAddPop,skill);
				//NewSkillAddPanelExt.showSkill(skill);
				AppManager.showApp(AppConstant.NEW_SKILL_ADD_PANLE,skill);
			});
			commandList.put( ".jz", function (...arg):void
			{
				SceneRoleManager.getInstance().onUpdateNeedle(MainRoleManager.actor,arg[0],arg[1]);
			});
			commandList.put( ".bat", function (...arg):void
			{
				AppManager.showApp(AppConstant.BATTLE_MAIN_PANEL,null,EmFunctionID.EM_TOWERS);
			});
			commandList.put( ".bat2", function (...arg):void
			{
				AppManager.showApp(AppConstant.BATTLE_MAIN_PANEL,null,EmFunctionID.EM_DIANFENGDUIJUE);
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
				var link:String=RichTextCustomUtil.getTextLinkCode("点击向我求婚",StaticValue.GREEN_TEXT,RichTextCustomLinkType.QIUHUN,MainRoleManager.actorInfo.name);		
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
				if(info.actCfg.q_show_notice==1&&FunctionOpenManager.checkOpenByFunId(info.actCfg.q_notice_trans)){
					AppManager.showAppNoHide(AppConstant.ACTIVETY_OPEN,info);
				}
			});
			commandList.put( ".send", function (...arg):void
			{
				var id:int = arg[0];
				arg.shift();
				NoticeManager.showNotifyById(id,null,arg);
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
				var speed:int=arg[0];
				MainRoleManager.actorInfo.totalStat.moveSpeed=speed;
				if (MainRoleManager.actor.stateMachine.isWalkMoving) 
				{
					var ref:WalkMoveStateReference=MainRoleManager.actor.stateMachine.getReference(WalkMoveStateReference) as WalkMoveStateReference;
					var moveInfo:RoleMoveInfo=new RoleMoveInfo();
					var posNow:Position=new Position();
					posNow.x=MainRoleManager.actor.pos.x;
					posNow.y=MainRoleManager.actor.pos.y;
					var path:Vector.<Position>=new Vector.<Position>();
					var pos:Position=new Position();
					pos.x=ref.nextPos.x;
					pos.y=-ref.nextPos.z;
					path.push(pos);
					var len:int=ref.leftPath.length;
					for (var i:int = 0; i < len; i++) 
					{
						pos=new Position();
						pos.x=ref.leftPath[i].x;
						pos.y=-ref.leftPath[i].z;
						path.push(pos);
					}
					moveInfo.setValues(MainRoleManager.actorID,speed,SystemTimeManager.curtTm,posNow,path);
					RoleStateUtil.walkByInfos(moveInfo);
				}
				MainRoleManager.actor.stateMachine.transition(RoleStateType.CONTROL_BUFF_SPRITEUP,MainRoleManager.actor.stateMachine.getReference(SpriteUpBuffStateReference));
				//				if (MainRoleManager.actor.stateMachine.isSpriteUp) 
				//				{
				//					MainRoleManager.actor.stateMachine.removeState(RoleStateType.CONTROL_BUFF_SPRITEUP);
				//				}
				//				else
				//				{
				//					var buffRef:SpriteUpBuffStateReference = MainRoleManager.actor.stateMachine.getReference(SpriteUpBuffStateReference) as SpriteUpBuffStateReference;
				//					MainRoleManager.actor.stateMachine.transition(RoleStateType.CONTROL_BUFF_SPRITEUP,buffRef);
				//				}
			});
			commandList.put( ".pet", function (...arg):void
			{
				//								AppManager.showAppNoHide(AppConstant.GRID_OPEM);
				AppManager.showApp(AppConstant.PET_PANLE);
				//				var mod:int = arg[0];				
				//				var petInfo:PetInfo=new PetInfo();
				//				petInfo.petId=new long(9999);
				//				petInfo.ownerId=(MainRoleManager.actor.data as HeroData).serverID;
				//				petInfo.petModelId=mod;
				//				petInfo.x=MainRoleManager.actor.pos.x;
				//				petInfo.y=MainRoleManager.actor.pos.y;
				//				var data:GirlPetData=new GirlPetData();
				//				data.setServerData(petInfo);
				//				SceneRoleManager.getInstance().createGirlPet(data);
			});
			commandList.put( ".fuli", function (...arg):void
			{
				AppManager.showApp(AppConstant.FULIDATING_MAIN);
			});
			commandList.put( ".sset", function (...arg):void
			{
				TrusteeshipManager.getInstance().autoSkillCtrl.resetSkill();
			});
			commandList.put( ".bullet", function (...arg):void
			{
				if (SceneRoleSelectManager.selectedRole) 
				{
					var msg:SCBuffSkillMessage=new SCBuffSkillMessage();
					msg.playerId=SceneRoleSelectManager.selectedRole.data.serverID;
					msg.skillId= 16779233;
					msg.targets.push(MainRoleManager.actorInfo.serverID);
					
					var role : SceneRole = SceneManager.getSceneObjByID(msg.playerId.ToGID()) as SceneRole;
					if (null == role || !role.usable) {
						return;
					}
					if (msg.targets.length < 1) {
						return;
					}
					var skillInfo : Q_skill_model = SpellDataManager.getSpellDataWithID(msg.skillId);
					if (null == skillInfo) {
						return;
					}
					var info : ReleaseSpellInfo = new ReleaseSpellInfo();
					info.spellData = skillInfo;
					info.atkor = role;
					info.atkorPos=new Point(role.x,role.z);
					info.flyTargetPosList = new Vector.<Position>();
					info.flyTargets = new Vector.<SceneRole>();
					for (var i : int = 0, len : int = msg.targets.length; i < len; ++i) {
						var targetRole : SceneRole = SceneManager.getSceneObjByID(msg.targets[i].ToGID()) as SceneRole;
						if (null == targetRole || !targetRole.usable) {
							continue;
						}
						info.flyTargets.push(targetRole);
					}
					info.readSpellEffectData(info.spellData.q_spell_effect);
					SpellAnimationHelper.addFlyEffect(info);
				}
				else
				{
					FloatingText.showUp("请选择目标测试");
				}
				
			});
			commandList.put( ".bullet3", function (...arg):void
			{
				
				for (var i:int = 0; i <arg[0]; i++) 
				{
					setTimeout(doCommand,1000*i,".bullet");
				}
				
			});
			commandList.put( ".ft", function (...arg):void
			{
				if (MainRoleManager.actor.stateMachine.isInFightState) 
				{
					MainRoleManager.actor.stateMachine.removeState(RoleStateType.CONTROL_ENTER_LEAVE_FIGHT);
				}
				else
				{
					MainRoleManager.actor.stateMachine.transition(RoleStateType.CONTROL_ENTER_LEAVE_FIGHT);
				}
			});
			commandList.put( ".b2", function (...arg):void
			{
				SpellAnimationHelper.use2=!SpellAnimationHelper.use2;
			});
			commandList.put( ".fb", function (...arg):void
			{
				var effectSet : RenderSet3D = RenderSet3D.create(SceneCharType.SCENE_FLY_SPELL/* + info.flySceneObjID*/, 1,true);
				var rud : RenderParamData3D = new RenderParamData3D(1, "effect", ClientConfig.getEffect("tx_role_qianjibian_03"), "tx_role_qianjibian_03");
				
				var effectRu : RenderUnit3D = effectSet.addRenderUnit(rud);
				SceneManager.addSceneObjToScene(effectSet);
				var pos:Vector3D=MainRoleManager.actor.getChildScenePositionByName(RenderUnitType.BODY, RenderUnitID.BODY, BoneNameEnum.c_0_body_02)
				//var pos:Vector3D=MainRoleManager.actor.position;
				effectSet.x=pos.x;
				//effectSet.y=pos.y;
				effectSet.z=pos.y;
				effectRu.repeat = 0;
				effectRu.mouseEnable = false;
				effectRu.play(0);
				TweenLite.to(effectSet,Number(arg[0]),{x:pos.x+int(arg[1]),z:pos.y+int(arg[2])});
			});
			commandList.put( ".pz", function (...arg):void
			{
				FightFaceHelper.useScene=arg[0]==1;
			});
			commandList.put( ".blood", function (...arg):void
			{
				HeadBloodBar.isShowText=!HeadBloodBar.isShowText;
			});
			commandList.put( ".newfun", function (...arg):void
			{
				var list:Vector.<String> = new Vector.<String>();
				list.push("2");
				list.push("10");
				UIPopManager.showAlonePopUI(OpenPanel,list);
			});
			commandList.put( ".hsort", function (...arg):void
			{
				HeadFace(MainRoleManager.actor.headFace).sort(); 
			});
			
			commandList.put( ".fc", function (...arg):void
			{
				var hash:org.client.mainCore.ds.HashMap = new org.client.mainCore.ds.HashMap();
				hash.add(14,40);
				hash.add(17,40);
				hash.add(11,40);
				hash.add(12,40);
				hash.add(13,40);
				hash.add(16,40);
				EventManager.dispatchEvent(MainPlayerEvent.MODULE_STAT_CHANGE,2,hash);
			});
			commandList.put( ".fp", function (...arg):void
			{
				FightPowerChangePopPanelExt.showFightPowerChange(arg[0],arg[1]);
			});
			commandList.put( ".cd", function (...arg):void
			{
				//FightPowerChangePopPanelExt.showFightPowerChange(arg[0],arg[1]);
				//CDDataManager.playCD("sd",1000);
				EquipAutoDressEffectPanelExt.ins.test(arg[0]);
			});
			commandList.put( ".next", function (...arg):void
			{
				//FightPowerChangePopPanelExt.showFightPowerChange(arg[0],arg[1]);
				//CDDataManager.playCD("sd",1000);
				TweenLiteUtil.next();
			});
			commandList.put( ".word", function (...arg):void
			{
				//FightPowerChangePopPanelExt.showFightPowerChange(arg[0],arg[1]);
				//CDDataManager.playCD("sd",1000);
				SpellResultTweenUtil.useOther=!SpellResultTweenUtil.useOther;
			});
			
			commandList.put( ".dx", function (...arg):void
			{
				//FightPowerChangePopPanelExt.showFightPowerChange(arg[0],arg[1]);
				//CDDataManager.playCD("sd",1000);
				for (var i:int = 0; i < arg[0]; i++) 
				{
					FightFaceHelper.showAttackFaceNew(MainRoleManager.actor,MainRoleManager.actor,MainRoleManager.actor.headFace,-1,FightFaceHelper.NUMBER_PC_HPSUB,-100-i*10,null,null,SpellResultTweenUtil.TweenDiaoXue);
				}
				
			});
			commandList.put( ".enter", function (...arg):void
			{
				AppManager.showApp(AppConstant.BATTLE_NINE_TOWER_NOTICE_PANEL,arg[0]);
				
			});
			commandList.put( ".debugpos", function (...arg):void
			{
				HeadFace.debug=true;
			});
			commandList.put( ".openitem", function (...arg):void
			{
				ItemOpenResultShowPanelExt.onShowNotice(arg);
			});
			commandList.put( ".fly", function (...arg):void
			{
				for (var i:int = 0; i < arg[0]; i++) 
				{
					//setTimeout(ResChangeEffect.fly,150*i,EnumItemId.GOLD,MainRoleManager.actor.headFace);
					ResChangeEffect.fly(arg[1],arg[2]);
				}	
			});
			commandList.put( ".title1", function (...arg):void
			{
				var ids:Vector.<int>=new Vector.<int>()
				for (var i:int = 0; i < arg[0]; i++) 
				{
				ids.push(arg[i+1]);
				}
				(MainRoleManager.actor.headFace as HeadFace).addAndUpdataRankTitle(ids);
			
			});
			commandList.put( ".title", function (...arg):void
			{
//				var ids:Vector.<int>=new Vector.<int>()
//				for (var i:int = 0; i < arg[0]; i++) 
//				{
//					ids.push(arg[i+1]);
//				}
//				(MainRoleManager.actor.headFace as HeadFace).addAndUpdataRankTitle(ids);
				if (arg[0]<0) 
				{
					(MainRoleManager.actor.headFace as HeadFace).removeTitleById(-arg[0]);
				}
				else
				{
					(MainRoleManager.actor.headFace as HeadFace).addTilteById(arg[0]);
				}
				
			});
			commandList.put( ".mainui", function (...arg):void
			{
				if (arg[0]==1) 
				{
					MainUIManager.setMainUIVisible(true);
					InputManger.getInstance().openOperate();
				}
				else 
				{
					MainUIManager.setMainUIVisible(false);
					InputManger.getInstance().closeOperate();
				}
				
			});
			commandList.put( ".look", function (...arg):void
			{
				if (arg[0]==1) 
				{
					//var pt:Vector3D=new Vector3D(arg[1],arg[2],arg[3]);
					//MainRoleManager.actor.lookPos=pt;
					Mgr.jjBattleMgr.unLockCamera();
				}
				else 
				{
					//MainRoleManager.actor.lookPos=null;
					Mgr.jjBattleMgr.lockCamera();
				}
				
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
