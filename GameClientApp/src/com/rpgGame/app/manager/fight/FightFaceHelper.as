package com.rpgGame.app.manager.fight
{
	import com.game.engine3D.controller.CameraController;
	import com.game.mainCore.libCore.handle.HandleThread;
	import com.gameClient.alert.AlertPanel;
	import com.gameClient.log.GameLog;
	import com.rpgGame.app.display2D.AttackFace;
	import com.rpgGame.app.fight.spell.SpellResultTweenUtil;
	import com.rpgGame.app.graphics.HeadFace;
	import com.rpgGame.app.manager.LostSkillManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.coreData.cfg.LostSkillData;
	import com.rpgGame.coreData.cfg.QVertexColorCfgData;
	import com.rpgGame.coreData.clientConfig.Q_lostskill_open;
	import com.rpgGame.coreData.clientConfig.Q_vertex_color;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.type.EnumHurtType;
	
	import flash.geom.Point;
	import flash.geom.Vector3D;
	
	import away3d.containers.ObjectContainer3D;
	
	import gs.TimelineLite;
	import gs.TweenLite;
	import gs.TweenMax;
	import gs.easing.Circ;
	import gs.easing.Cubic;
	import gs.easing.Elastic;
	import gs.easing.Linear;
	
	import org.client.mainCore.ds.HashMap;
	import org.game.netCore.data.long;
	
	import starling.display.DisplayObject;

	/**
	 * 飘字管理
	 * head控制器(除换装外的一切)
	 * @author
	 *
	 */
	public class FightFaceHelper
	{
		public static var useScene:Boolean=true;
		public static var layer:FightFaceLayer=new FightFaceLayer();
		public static function bindTarget(mainPlayer:ObjectContainer3D):void
		{
			layer.x=0;
			layer.y=0;
			StarlingLayerManager.sceneEffectLayer.addChildAt(layer,0);
			layer.bind(mainPlayer);
		}
		/** 根路径 **/
		public static const ROOT : String = "ui/art_txt/fight/";
		//---------------------------文字------------------------------------------//
		/** 有用，正面特效，其实就是图片是绿色的**/
		public static const USESFUL_EFFECT : String = "fight_effect/usesful_effect/";
		/** 无用，反面特效，其实就是图片是红色的**/
		public static const HARMFUL_EFFECT : String = "fight_effect/harmful_effect/";
		
		/** 属性效果**/
		public static const ATTRIBUTE_EFFECT : String = "attribute_effect/";
		public static const ATT_NUM:int=16;
		//-----------------------数字------------------------------------------//
		/** usesful 数字**/
		public static const ATTRIBUTE_USESFUL_NUM : int = 51;
		/** harmful字**/
		public static const ATTRIBUTE_HARMFUL_NUM : int = 52;
		
		
		/** 战斗-目标飘字 受伤**/
		public static const NUMBER_NPC_HIT : int = 2;
		/** 战斗-自身飘字 回血**/
		public static const NUMBER_PC_HPREC : int = 1;
		/** 战斗-自身飘字 掉血**/
		public static const NUMBER_PC_HPSUB : int =3;
		/**  经验增加**/
		public static const NUMBER_PC_EXP : int =4;
		/** 战斗-目标飘字 受暴击**/
		public static const NUMBER_NPC_CRIT : int = 5;
		/** 战斗-目标飘字 战魂**/
		public static const NUMBER_NPC_ZHANHUN : int = 6;
		/** 战斗-目标飘字 吸收**/
		public static const NUMBER_FIGHT_XISHOU : int = 7;
		
		/** 战斗-目标飘字 礼金**/
		public static const NUMBER_BIND_GOLD : int = 8;

		/** 战斗-自身飘字 回蓝（深蓝色） **/
		public static const NUMBER_PC_MPREC : int = NUMBER_BULE;
		/** 积分**/
		public static const NUMBER_SCORE : int = 66;

		/** 加号 **/
		public static const NUMBER_JIA : String = "jia";
		/** 减号 **/
		public static const NUMBER_JIAN : String = "jian";
		/** 飘字队列 **/
		private static var _queueThread : HandleThread = new HandleThread(null, true, 20);

		
		//-----------------------下面是旧版的飘字（暂时留着，整理完新版的再干掉）--------------------------------------------------------------------//
		
		
		/** 蓝 数字**/
		public static const NUMBER_BULE : int =9;

		
		/**
		 *伤害类型 
		 */
		public static const TWEEN_FUNCS:Array=[SpellResultTweenUtil.TweenHurt,
																		  SpellResultTweenUtil.TweenShanBi,
																		  SpellResultTweenUtil.TweenHits,
																		  SpellResultTweenUtil.TweenCirt,
																		  SpellResultTweenUtil.TweenCirt,
																		  SpellResultTweenUtil.TweenCirt,
																		  SpellResultTweenUtil.TweenCirt,
																		  SpellResultTweenUtil.TweenCirt,
																		  SpellResultTweenUtil.TweenCirt,
																		  SpellResultTweenUtil.TweenCirt];
		/**
		 * 得到攻击效果的指定类型的URL
		 * @param hurtType 伤害类型
		 * @param isUsesful	是否正面效果，相对主角自己而言的
		 * @return
		 *
		 */
		public static function getFightURlByAttType(hurtType : String, isUsesful : Boolean) : int
		{
			var url:String=ROOT+USESFUL_EFFECT+hurtType+".png";
			var info:Q_vertex_color=QVertexColorCfgData.getVertexColorCfgByUrl(url);
			var id:int=-1;
			if(info){
				id=info.q_id;
			}
			return id;
		}

		/**
		 * 人物属性字
		 * @param type 类型
		 * @param isUsesful 是否是正面效果
		 * @return
		 *
		 */
		public static function getAttributeUrl(type : int, isUsesful : Boolean) : int
		{
			var url:String= ROOT + ATTRIBUTE_EFFECT + type + ".png";
			var info:Q_vertex_color=QVertexColorCfgData.getVertexColorCfgByUrl(url);
			var id:int=-1;
			if(info){
				id=info.q_id;
				if(!isUsesful){
					id=(id+ATT_NUM)-1;//正反面相差16必须放在一起
				}
			}
			return id;
		}

		/**
		 * 根据数字资源类型得到单字数字URL
		 * @param numberType	参考：  NUMBER_BULE
		 * @param number		根据数字，0-9、jia( NUMBER_JIA)、jian
		 * @return
		 *
		 */
		public static function getNumberURLByType(numberType : String, number : String) : String
		{
			return numberType + number + ".png";
		}
		/**
		 *飘字是否主角能看见 
		 * @param atkor
		 * @param hurter
		 * 
		 */		
		public static function isICanSeeText(atkor : SceneRole, hurter : SceneRole):Boolean
		{
			if (hurter==null) 
			{
				return false;
			}
			var showFace:Boolean = false;
			var roleData:RoleData;
			if(atkor && atkor.usable)
			{
				roleData = atkor.data as RoleData;
				if(roleData)
				{
					if(roleData.id == MainRoleManager.actorID || roleData.ownerId == MainRoleManager.actorID)
					{
						showFace = true;
					}
				}
			}
			if(hurter && hurter.usable)
			{
				roleData = hurter.data as RoleData;
				if(roleData)
				{
					if(roleData.id == MainRoleManager.actorID || roleData.ownerId == MainRoleManager.actorID)
					{
						showFace = true;
					}
				}
			}
			return showFace;
		}
		/**
		 * 伤害飘字
		 * @param atkor 场景角色
		 * @param hurter 受伤害的角色
		 * @param hurtType 飘字类型 【 0. 普通. 1. 闪避, 2. 暴击, 3. 重击, 4. 跳闪，5.无敌，6.物理免疫，7.魔法免疫，8.反弹，9.目标吸收伤害，10.角色吸收伤害 】
		 * @param hurtAmount 伤害数值 大于0加血，小于0伤害
		 *
		 */
		public static function showHurtTextNew(atkor : SceneRole, hurter : SceneRole, hurtType : uint, hurtAmount : int) : void
		{
			if (hurter == null)
				return;
			//提前判断，面得做无用功
			var iCanSee:Boolean=isICanSeeText(atkor,hurter);
			if (!iCanSee) 
			{
				return;
			}
			var mainPlayer : SceneRole = MainRoleManager.actor; //主角
			var typeRes : int=-1; //得到攻击效果的指定类型的URL
			
			var numberType : int=-1 ; //飘字数字颜色类型
			var tweenFun : Function; //飘字回调
			//加血咯
			if (hurtAmount>0) 
			{
				numberType=NUMBER_PC_HPREC;
				tweenFun=SpellResultTweenUtil.TweenZhiLiao1;
			}
			var tweenDis : int;
			var dirVec : Vector3D;
		
		
			var extAtf:AttackFace=null;
			var num:int=EnumHurtType.SPELL_HURT_TYPES.length;
			for(var i:int=0;i<num;i++)
			{
				extAtf=null;
				var type:uint=EnumHurtType.SPELL_HURT_TYPES[i];
				var result:uint=type&hurtType;
				if(result!=0||hurtType==0)
				{
					//type=EnumHurtType.SPELL_ZHANHUN;
					switch (type)
					{
						case EnumHurtType.SPELL_HURT_TYPE_REBOUND:
						case EnumHurtType.SPELL_HURT_TYPE_INVINCIBLE: 
						case EnumHurtType.SPELL_HURT_TYPE_NORMAL: 
							typeRes = -1;
							//掉血
							if (hurtAmount<0) 
							{
								numberType = NUMBER_NPC_HIT;
								tweenFun=SpellResultTweenUtil.TweenHurt;
								//我自己掉血
								if (hurter.isMainChar) 
								{
									numberType=NUMBER_PC_HPSUB;
									tweenFun=SpellResultTweenUtil.TweenDiaoXue;
								}
							}
							extAtf=LostSkillManager.instance().hasBossHurtAddAtf(hurter.data.serverID,atkor.data.serverID,hurtAmount);
							if (!extAtf) 
							{
								extAtf=LostSkillManager.instance().hasAttackPlayerAddAtf(hurter.data.serverID,atkor.data.serverID,hurtAmount);
							}
							break;
						case EnumHurtType.SPELL_HURT_TYPE_MISS: //闪避
							//
							if (atkor.isMainChar) 
							{
								typeRes = 11;
								tweenFun=SpellResultTweenUtil.TweenHits;
							}
							else if (hurter.isMainChar) 
							{
								typeRes =10;
								tweenFun=SpellResultTweenUtil.TweenShanBi;
							}
						
							break;
						case EnumHurtType.SPELL_HURT_TYPE_CRIT: //暴击
							typeRes = 12;
							numberType = NUMBER_NPC_CRIT;
							//治疗
							if (hurtAmount>0) 
							{
								typeRes = 13;
								numberType = NUMBER_PC_HPREC;
							}
							tweenFun=SpellResultTweenUtil.TweenCirt;
							
							extAtf=LostSkillManager.instance().hasBossHurtAddAtf(hurter.data.serverID,atkor.data.serverID,hurtAmount);
							if (!extAtf) 
							{
								extAtf=LostSkillManager.instance().hasAttackPlayerAddAtf(hurter.data.serverID,atkor.data.serverID,hurtAmount);
							}
							break;
						case EnumHurtType.SPELL_ZHANHUN:
							typeRes = 16;
							tweenFun=SpellResultTweenUtil.TweenZhanHun;
							numberType = NUMBER_NPC_ZHANHUN;
							break;
						case EnumHurtType.SPELL_SHEILD_XISHOU:
						//case EnumHurtType.SPELL_HURT_TYPE_ABSORB:
							typeRes = 17;
							tweenFun=SpellResultTweenUtil.TweenXiShou;
							numberType =NUMBER_FIGHT_XISHOU;
							break;
						default:
							CONFIG::Debug {
							var loginfo:String = "未处理的伤害类型:"+type;
							GameLog.addError(loginfo);
							AlertPanel.showMsg( loginfo, null );
						}
							break;
					}
					
					if(!tweenFun)
					{
						tweenFun = SpellResultTweenUtil.TweenHurt;
					}
					//加血
					if (hurtAmount>0) 
					{
						showAttackFaceNew(hurter,atkor,atkor.headFace,typeRes,numberType,hurtAmount,null,null,tweenFun,extAtf);
					}
					//伤害
					else
					{
						showAttackFaceNew(atkor,hurter,hurter.headFace,typeRes,numberType,hurtAmount,null,null,tweenFun,extAtf);
					}
					
					//				}
					if(hurter.data.id!=MainRoleManager.actorID)
					{
						var headFace:HeadFace=hurter.headFace as HeadFace;
						if(headFace && !hurter.stateMachine.isDeadState)
						{
							headFace.showBloodBar();
						}
					}
				}
				if(hurtType==0&&type==0)
				{
					break;
				}
			}
		}
		/**
		 * 伤害飘字
		 * @param atkor 场景角色
		 * @param hurter 受伤害的角色
		 * @param hurtType 飘字类型 【 0. 普通. 1. 闪避, 2. 暴击, 3. 重击, 4. 跳闪，5.无敌，6.物理免疫，7.魔法免疫，8.反弹，9.目标吸收伤害，10.角色吸收伤害 】
		 * @param hurtAmount 伤害数值
		 *
		 */
		public static function showHurtText(atkor : SceneRole, hurter : SceneRole, hurtType : uint, hurtAmount : int) : void
		{
			if (hurter == null)
				return;

			var mainPlayer : SceneRole = MainRoleManager.actor; //主角
			var typeRes : int=-1; //得到攻击效果的填充类型id
			var isUsefulBmp : Boolean = true; //是否正面效果，相对主角自己而言的
			var fillNumber : int=-1 ; //填充数字id
			var tweenDis : int;
			var dirVec : Vector3D;
			var tweenFun : Function; //飘字回调
			var from : Point; //起始点
			var end : Point; //结束点
			var scaleAgo : Number = 0; //飘字缩放--前
			var scaleLater : Number = 0; //飘字缩放--后
			
			var num:int=EnumHurtType.SPELL_HURT_TYPES.length;
			for(var i:int=0;i<num;i++){
				var type:uint=EnumHurtType.SPELL_HURT_TYPES[i];
				var result:uint=type&hurtType;
				if(result!=0||hurtType==0){
					switch (type)
					{
						case EnumHurtType.SPELL_HURT_TYPE_REBOUND:
						case EnumHurtType.SPELL_HURT_TYPE_INVINCIBLE: 
						case EnumHurtType.SPELL_HURT_TYPE_NORMAL: 
							typeRes = -1;
							isUsefulBmp = hurter.isMainChar;
							scaleAgo = 1.5;
							scaleLater = 0.5;
							fillNumber = NUMBER_NPC_HIT;
							if(isUsefulBmp){
								fillNumber=NUMBER_PC_HPSUB;
							}
							if (atkor.id == MainRoleManager.actorID||hurter.id == MainRoleManager.actorID) 
							{
								if( hurtAmount> 0){
									typeRes=getFightURlByAttType(EnumHurtType.ADDHP, true);
									scaleAgo=1;
									scaleLater=1;
									var sc:SceneRole;
									if(atkor.id == MainRoleManager.actorID){
										sc=SceneManager.getSceneObjByID(hurter.id) as SceneRole;
									}else{
										sc=MainRoleManager.actor;
									}
									showQueueAttackFace(sc, typeRes, NUMBER_PC_HPREC, hurtAmount, scaleAgo, scaleLater, null, null, null, null, tweenUp);//回血
									return;
								}
							}	
							
							break;
						case EnumHurtType.SPELL_HURT_TYPE_MISS: //闪避
							typeRes = 11;
							scaleAgo = 2;
							scaleLater = 1;
							tweenFun=tweenUp;
							break;
						case EnumHurtType.SPELL_HURT_TYPE_CRIT: //暴击
							typeRes = 12;
							scaleAgo = 2;
							scaleLater = 1;
							fillNumber = NUMBER_NPC_CRIT;
							break;
						default:
							CONFIG::Debug {
							var loginfo:String = "未处理的伤害类型:"+type;
							GameLog.addError(loginfo);
							AlertPanel.showMsg( loginfo, null );
						}
							break;
					}
					
					if(!tweenFun){
						tweenFun = tweenTypeRoleHurt;
					}
					var showFace:Boolean = false;
					var roleData:RoleData;
					if(atkor && atkor.usable)
					{
						roleData = atkor.data as RoleData;
						if(roleData)
						{
							if(roleData.id == MainRoleManager.actorID || roleData.ownerId == MainRoleManager.actorID)
							{
								showFace = true;
							}
						}
					}
					if(hurter && hurter.usable)
					{
						roleData = hurter.data as RoleData;
						if(roleData)
						{
							if(roleData.id == MainRoleManager.actorID || roleData.ownerId == MainRoleManager.actorID)
							{
								showFace = true;
							}
						}
					}
					if (showFace) //主角或主角所属角色受伤害/攻击...
					{
						var isLeftShow : Boolean = (atkor && hurter) ? (atkor.x - hurter.x >= 0) : false;//攻击者在被攻击者的右侧
						//是否正面效果，相对主角自己而言的   是主角还是场景其他SceneRole，因为主角同时受到攻击的时候，伤害数值同时出现，造成重叠，所以用队列飘字，避免重叠
						/*if (isUsefulBmp)
						{
						showQueueAttackFace(hurter, typeRes, numberType, hurtAmount, scaleAgo, scaleLater, from, end, null, null, tweenFun, isLeftShow);
						}
						elseq
						{*/
						showAttackFace(hurter.headFace, typeRes, fillNumber, hurtAmount, null, null, tweenFun, from, end, scaleAgo, scaleLater, isLeftShow);
						//				}
						if(hurter.data.id!=MainRoleManager.actorID){
							var headFace:HeadFace=hurter.headFace as HeadFace;
							if(headFace && !hurter.stateMachine.isDeadState){
								headFace.showBloodBar();
							}
						}
					}
				}
				
				if(hurtType==0&&type==0){
					break;
				}
			}
		}
		
		/**
		 * 角色伤害飘字 （单行飘字。要两行飘字，配合tweenTypeRoleHurt2方法用）
		 * @param attackFace 飘字对象
		 * @param $offset 偏移
		 * @param $from 开始点
		 * @param $end 结束点
		 * @param $scaleAgo 飘字缩放--前
		 * @param $scaleLater 飘字缩放--后
		 * @param isLeftShow
		 * @param onComplete 飘字完成回调
		 * @author 陈鹉光 2016-01-28
		 */
		public static function tweenTypeRoleHurt(attackFace : DisplayObject, $displayObjectContainer:*, $from : Point, $end : Point, $scaleAgo : Number, $scaleLater : Number, isLeftShow : Boolean = false, onComplete : Function = null) : void
		{
			$scaleAgo=1.6;
			$scaleLater=0.7 ;
			
			attackFace.scaleX = attackFace.scaleY = 1;
			$end=new Point();
			var end2:Point=new Point();
			var random:Number=Math.random();
			$from=new Point(-attackFace.width/2,-50);
			attackFace.y=$from.y+20;
			
			$end.y=-80+50*random;
			isLeftShow=random>0.5;//随机计算
			end2.y=$end.y+30+10*random;
			var randomV:Number=10+random*10;
			var randomV1:Number=attackFace.width-random*50;
			if(isLeftShow){//往左飘
				$from.x-=randomV;
				$end.x=$from.x-randomV;
				end2.x=$end.x-randomV-30;
			}else{
				$from.x+=randomV;
				$end.x=$from.x+randomV;
				end2.x=$end.x+randomV+30;
			}
			attackFace.x=$from.x;
			
			var timeLine : TimelineLite = new TimelineLite();
			timeLine.append(TweenLite.to(attackFace, 0, { x:$from.x,y:$from.y,scaleX: $scaleAgo, scaleY: $scaleAgo,ease:Elastic.easeOut}));//小到大
			timeLine.append(TweenLite.to(attackFace, 0.2, {}));//大到小
			timeLine.append(TweenLite.to(attackFace, 0.2, { x:$end.x,y:$end.y,scaleX: $scaleLater, scaleY: $scaleLater,ease:Circ.easeOut}));//大到小
			timeLine.append(TweenLite.to(attackFace, 0.3, { x:$end.x,y:$end.y,scaleX: $scaleLater+0.1, scaleY: $scaleLater+0.1,alpha:0.8,ease:Cubic.easeOut}));//小到大
			timeLine.append(TweenLite.to(attackFace, 0.5, { x:end2.x,y:end2.y,alpha:0,onComplete: onComplete, onCompleteParams: [attackFace],ease:Cubic.easeOut}));
		}
		
		private static function updateCenter(face:AttackFace):void
		{
			face.x=-face.width/2;
		}
		//主要绝学
		public static function showBuffNameEffect(buff:int,attackerId:long,value:int=0):void
		{
			var qSkill:Q_lostskill_open=LostSkillData.getModeInfoById(buff);
			if (!qSkill) 
			{
				return;
			}
			var attacker:SceneRole=SceneManager.getSceneObjByID(attackerId.ToGID()) as SceneRole;
			if (!attacker) 
			{
				return;
			}
			var typeRes:int =getFightURlByAttType(qSkill.q_icon, true);
			showQueueAttackFaceNew(attacker,null,attacker.headFace, typeRes, NUMBER_PC_EXP, value,  null, null,SpellResultTweenUtil.TweenHead)
		}
		/**
		 *这个主要是角色战斗力相关属性 
		 * @param list
		 * 
		 */		
		public static function showPlayerBaseAttrChange(hash:HashMap):void
		{
			var keys:Array=hash.keys();
			keys.sort();
			var len:int=keys.length;
			var key:int=0;
			var val:int=0;
			var typeRes : int = -1;
			var numberColor : int = -1;
			for (var i:int = 0; i <len; i++) 
			{
				key=keys[i];
				//移动速度不显示
				if (CharAttributeType.SPEED==key) 
				{
					continue;
				}
				val=hash.getValue(key);
				if(val == 0)
				{
					continue;
				}
				
				typeRes=getAttributeUrl(key,val>0);
				numberColor=val>0?ATTRIBUTE_USESFUL_NUM:ATTRIBUTE_HARMFUL_NUM;
				var attackFace : AttackFace;
				if(_showAttackFaceList.containsKey(typeRes))
				{
					attackFace = _showAttackFaceList.getValue(typeRes) as AttackFace;
					attackFace.visible = false
				}
				showQueueAttackFaceNew(MainRoleManager.actor,null,MainRoleManager.actor.headFace, typeRes, numberColor, val,  null, null,SpellResultTweenUtil.TweenAttrChange)
			}
			
		}
		/**
		 * 显示属性改变
		 * @param type
		 * @param count
		 *
		 */
		public static function showAttChange(type : String, count : int,show:int=0) : void
		{
			
			var typeRes : int = getFightURlByAttType(type, true);
			var numberColor : int = -1;
			switch (type)
			{
				case EnumHurtType.SUBHP: //减血血
					typeRes=-1;
					numberColor=NUMBER_PC_HPSUB;
					showQueueAttackFaceNew(MainRoleManager.actor,MainRoleManager.actor,MainRoleManager.actor.headFace, typeRes, numberColor, count,  null, null,SpellResultTweenUtil.TweenDiaoXue)
					return;
				case EnumHurtType.ADDHP: //回血
					typeRes=-1;
					numberColor=NUMBER_PC_HPREC;
					var extAtf:AttackFace=null;
					if (show==2) 
					{
						extAtf=LostSkillManager.instance().hasXiQuHpAtf((MainRoleManager.actor.data as RoleData).serverID,0);
					}
					
					showQueueAttackFaceNew(MainRoleManager.actor,null,MainRoleManager.actor.headFace, typeRes, numberColor, count,  null, null,SpellResultTweenUtil.TweenZhiLiao1,extAtf)
				//	showQueueAttackFace(MainRoleManager.actor, typeRes, numberColor, count, scaleAgo, scaleLater, null, null, null, null, tweenUp);
					return;
				case EnumHurtType.ADDMP: //回蓝
					numberColor = NUMBER_PC_MPREC;
					showQueueAttackFaceNew(MainRoleManager.actor,null,MainRoleManager.actor.headFace, typeRes, numberColor, count,  null, null,SpellResultTweenUtil.TweenZhiLiao2)
					return;
				case EnumHurtType.EXP: //经验
					numberColor = NUMBER_PC_EXP;
					var exdata:AttackFace=LostSkillManager.instance().hasExpAddAtf(MainRoleManager.actorInfo.serverID,count);
					//showQueueAttackFace(MainRoleManager.actor, typeRes, numberColor, count, scaleAgo, scaleLater, null, null, null, null, tweenUp);
					showQueueAttackFaceNew(MainRoleManager.actor,null,MainRoleManager.actor.headFace, typeRes, numberColor, count,  null, null,SpellResultTweenUtil.TweenExp,exdata);
					return;
				case EnumHurtType.BIND_GOLD: //礼金
					numberColor = NUMBER_BIND_GOLD;
					//var golddata:AttackFace=LostSkillManager.instance().hasGoldAddAtf(MainRoleManager.actorInfo.serverID,count);
					showQueueAttackFaceNew(MainRoleManager.actor,null,MainRoleManager.actor.headFace, typeRes, numberColor, count,  null, null,SpellResultTweenUtil.TweenZhiLiao2);
					return;
				case EnumHurtType.JI_FEN: //积分
					numberColor = NUMBER_SCORE;
					showQueueAttackFaceNew(MainRoleManager.actor,null,MainRoleManager.actor.headFace, typeRes, numberColor, count,  null, null,SpellResultTweenUtil.TweenExp);
					return;
				default:
					break;
			}
			showQueueAttackFaceNew(MainRoleManager.actor,null,MainRoleManager.actor.headFace, typeRes, numberColor, count,  null, null,SpellResultTweenUtil.TweenExp);
			//showQueueAttackFace(MainRoleManager.actor, typeRes, numberColor, count, scaleAgo, scaleLater, null, null, null, null, tweenTypeRoleHurt);
		}
		
		public static function tweenTypeRoleMiss(attackFace : DisplayObject, $displayObjectContainer:*, $from : Point, $end : Point, $scaleAgo : Number, $scaleLater : Number, isLeftShow : Boolean = false, onComplete : Function = null) : void
		{
			
			attackFace.x=-attackFace.width/2;
			attackFace.scaleX = attackFace.scaleY = $scaleAgo;
			$end=new Point(attackFace.x,attackFace.y);
			
			var timeLine : TimelineLite = new TimelineLite();
			timeLine.insert(TweenLite.to(attackFace, 0.2, {scaleX: $scaleLater, scaleY: $scaleLater, ease: Linear.easeOut}));//缩放
			timeLine.append(TweenLite.to(attackFace, 0.5, {x:$end.x,y:$end.y,alpha: 0,onComplete: onComplete, onCompleteParams: [attackFace], ease: Linear.easeIn}));//隐藏
		}
		
		/**
		 *向上飘 
		 * @param attackFace
		 * @param $displayObjectContainer
		 * @param $from
		 * @param $end
		 * @param $scaleAgo
		 * @param $scaleLater
		 * @param isLeftShow
		 * @param onComplete
		 * 
		 */
		public static function tweenUp(attackFace : DisplayObject, $displayObjectContainer:*, $from : Point, $end : Point, $scaleAgo : Number, $scaleLater : Number, isLeftShow : Boolean = false, onComplete : Function = null) : void
		{
			attackFace.x = -attackFace.width/2;
			attackFace.y =-attackFace.height/2;
			var timeLine : TimelineLite = new TimelineLite();
			timeLine.insert(TweenLite.to(attackFace, 0.3, {ease: Linear.easeOut}));//缩放
			timeLine.append(TweenLite.to(attackFace, 0.3, {y:attackFace.y-50,alpha:0,onComplete: onComplete, onCompleteParams: [attackFace], ease: Linear.easeIn}));//隐藏
		}

		/**
		 * 从指定场景对象处飘出一个AttackFace对象
		 * @param $sc 开始飘字的场景对象
		 * @param $attackType 飘字类型
		 * @param numberRes 指定类型的URL
		 * @param $attackValue 飘出的数值
		 * @param $scaleAgo 飘字缩放--前
		 * @param $scaleLater 飘字缩放--后
		 * @param $from 起始点
		 * @param $end 结束点
		 * @param $specialType 飘出的数值类型
		 * @param $specialPos 飘出的数值的偏移值
		 * @param $tweenFun
		 * @param $isLeftShow
		 * @param $queueTm 延迟毫秒数
		 *
		 */
		public static function showQueueAttackFace($sc : SceneRole, $attackType : int = -1, numberRes : int = -1, $attackValue : * = 0, $scaleAgo : Number = 1, $scaleLater : Number = 1, $from : Point = null, $end : Point = null, $specialType : String = null, $specialPos : Point = null, $tweenFun : Function = null, $isLeftShow : Boolean = false, $queueTm : uint = 50) : void
		{
			_queueThread.push(showAttackFace, [$sc.headFace, $attackType, numberRes, $attackValue, $specialType, $specialPos, $tweenFun, $from, $end, $scaleAgo, $scaleLater, $isLeftShow], $queueTm);
		}

		/**
		 * 显示一个AttackFace对象
		 * @param showContainer 容器
		 * @param typeRes 指定类型的URL
		 * @param numberRes 飘字数字颜色类型
		 * @param $attackValue 飘出的数值
		 * @param $specialType 飘出的数值类型
		 * @param $specialPos 飘出的数值的偏移值
		 * @param $tweenFun 飘字回调
		 * @param $from 起始点
		 * @param $end 结束点
		 * @param $scaleAgo 飘字缩放--前
		 * @param $scaleLater 飘字缩放--后
		 * @param isLeftShow
		 *
		 */
		public static function showAttackFace(showContainer : *, typeRes : int = -1, numberType :  int = -1, $attackValue : * = 0, $specialType : String = null, $specialPos : Point = null, $tweenFun : Function = null, $from : Point = null, $end : Point = null, $scaleAgo : Number = 1, $scaleLater : Number = 1, isLeftShow : Boolean = false) : void
		{
			if (showContainer == null)
				return;
			var attackFace : AttackFace = AttackFace.createAttackFace(typeRes, numberType, $attackValue, $specialType, $specialPos);
			attackFace.touchAcross = true;
			attackFace.touchable = false;
			attackFace.touchGroup = false;
			tweenFromSceneChar(showContainer, attackFace, $from, $end, $scaleAgo, $scaleLater, $tweenFun, isLeftShow, onAtackFaceComplete);
		}
		public static function showQueueAttackFaceNew(attacker:SceneRole,hurter:SceneRole,showContainer : *, typeRes : int = -1, numberRes : int = -1, $attackValue : * = 0, $specialType : String = null, $specialPos : Point = null, $tweenFun : Function = null,extendData:Object=null,$queueTm : uint = 50) : void
		{
			_queueThread.push(showAttackFaceNew, [attacker, hurter, showContainer,typeRes,numberRes, $attackValue, $specialType, $specialPos, $tweenFun,extendData], $queueTm);
		}
		private static var _showAttackFaceList:HashMap = new HashMap();
		public static function showAttackFaceNew(attacker:SceneRole,hurter:SceneRole,showContainer : *, typeRes : int = -1, numberType :  int = -1, $attackValue : * = 0, $specialType : String = null, $specialPos : Point = null, $tweenFun : Function = null,extendData:Object=null) : void
		{
			if (showContainer == null)
				return;
			/*if(_showAttackFaceList.containsKey(typeRes))
			{
				attackFace = _showAttackFaceList.getValue(typeRes) as AttackFace;
				attackFace.visible = false
			}*/
			
			var attackFace : AttackFace= AttackFace.createAttackFace(typeRes, numberType, $attackValue, $specialType, $specialPos,extendData);
			attackFace.touchAcross = true;
			attackFace.touchable = false;
			attackFace.touchGroup = false;
			attackFace.visible = true;
			_showAttackFaceList.add(typeRes,attackFace);
			tweenFromSceneCharNew(attacker,hurter,showContainer, attackFace, $tweenFun, onAtackFaceComplete);
		}
		private static function tweenFromSceneCharNew(attacker:SceneRole,hurter:SceneRole,showContainer : *, $displayObject : AttackFace, $tweenFun : Function = null, $onComplete : Function = null) : void
		{
			tweenFromNew(attacker,hurter,showContainer, $displayObject, $tweenFun,$onComplete);
		}
		
		private static function tweenFromNew(attacker:SceneRole,hurter:SceneRole,$displayObjectContainer : *, attackFace : AttackFace,$tweenFun : Function = null,$onComplete : Function = null) : void
		{
			if (null == $displayObjectContainer)
			{
				$onComplete(attackFace); // 动画就算不播放，也要调用完成函数
				return;
			}
		
			var start:Point;
			var end:Point;
			//走场景
			if (useScene&&(SpellResultTweenUtil.TweenCirt==$tweenFun||SpellResultTweenUtil.TweenHurt==$tweenFun||SpellResultTweenUtil.TweenDiaoXue==$tweenFun)) 
			{
				layer.addChild(attackFace);
				if (null != $tweenFun)
				{
					start=new Point(attacker.pos.x,attacker.pos.y-50);
					end=null
					if (hurter) 
					{
						end=new Point(hurter.pos.x,hurter.pos.y-50);
					}
					
					$tweenFun(attackFace,start,end, $onComplete);
				}
			}
			else
			{
				/*if (SpellResultTweenUtil.TweenAttrChange==$tweenFun) 
				{
					StarlingLayerManager.topUILayer.addChild(attackFace);
				}
				else
				{*/
				StarlingLayerManager.sceneEffectLayer.addChild(attackFace);
//				}
				if (null != $tweenFun)
				{
					start=new Point(attacker.headFace.x,attacker.headFace.y);
					end=null
					if (hurter) 
					{
						end=new Point(hurter.headFace.x,hurter.headFace.y);
					}
					
					$tweenFun(attackFace,start,end, $onComplete);
				}
			}
			//$displayObjectContainer.addChild(attackFace);
//			var layer:Sprite=StarlingLayerManager.headFaceLayer;

						
						
		}
		/**
		 *
		 * @param $sc 开始飘字的场景对象
		 * @param $displayObject AttackFace对象
		 * @param $from 起始点
		 * @param $end 结束点
		 * @param $funTween 回调
		 * @param $isLeftShow
		 * @param $onComplete
		 * @param $queueTm
		 *
		 */
//		public static function showQueueTweenFromSceneChar($sc : SceneRole, $displayObject : AttackFace, $from : Point, $end : Point, $funTween : Function = null, $isLeftShow : Boolean = false, $onComplete : Function = null, $queueTm : uint = 250) : void
//		{
//			_queueThread.push(tweenFromSceneChar, [$sc, $displayObject, $from, $end, $funTween, $isLeftShow, $onComplete], $queueTm);
//		}

		/**
		 * 场景跳字
		 * @param showContainer 容器
		 * @param $displayObject AttackFace对象
		 * @param $from 起始点
		 * @param $end 结束点
		 * @param $scaleAgo 飘字缩放--前
		 * @param $scaleLater 飘字缩放--后
		 * @param $funTween 回调
		 * @param $isLeftShow
		 * @param $onComplete
		 *
		 */
		private static function tweenFromSceneChar(showContainer : *, $displayObject : AttackFace, $from : Point, $end : Point, $scaleAgo : Number = 0, $scaleLater : Number = 0, $funTween : Function = null, $isLeftShow : Boolean = false, $onComplete : Function = null) : void
		{
			tweenFrom(showContainer, $displayObject, $from, $end, $scaleAgo, $scaleLater, $funTween, $isLeftShow, $onComplete);
		}

		/**
		 * 飘字队列
		 * @param $displayObjectContainer 容器
		 * @param $displayObject AttackFace对象
		 * @param $from 起始点
		 * @param $end 结束点
		 * @param $funTween 回调
		 * @param $isLeftShow
		 * @param $onComplete
		 * @param $queueTm
		 *
		 */
//		private static function showQueueTweenFrom($displayObjectContainer : Sprite, $displayObject : DisplayObject, $from : Point, $end : Point, $funTween : Function = null, $isLeftShow : Boolean = false, $onComplete : Function = null, $queueTm : uint = 250) : void
//		{
//			_queueThread.push(tweenFrom, [$displayObjectContainer, $displayObject, $from, $end, $funTween, $isLeftShow, $onComplete], $queueTm);
//		}

		/**
		 * 场景飘字坐标转换
		 * @param $displayObjectContainer  容器
		 * @param attackFace AttackFace对象
		 * @param $from 起始点
		 * @param $end 结束点
		 * @param $scaleAgo 飘字缩放--前
		 * @param $scaleLater 飘字缩放--后
		 * @param $funTween 回调
		 * @param $isLeftShow
		 * @param $onComplete
		 *
		 */
		private static function tweenFrom($displayObjectContainer : *, attackFace : AttackFace, $from : Point, $end : Point, $scaleAgo : Number = 0, $scaleLater : Number = 0, $funTween : Function = null, $isLeftShow : Boolean = false, $onComplete : Function = null) : void
		{
			if (null == $displayObjectContainer)
			{
				$onComplete(attackFace); // 动画就算不播放，也要调用完成函数
				return;
			}
			$displayObjectContainer.addChild(attackFace);
//			StarlingLayerManager.headFaceLayer.addChild(attackFace);

			if (null != $funTween)
			{
				$funTween(attackFace, $displayObjectContainer, $from, $end, $scaleAgo, $scaleLater, $isLeftShow, $onComplete);
			}
		}

		/**
		 * 动画完成回调
		 * @param $displayObject
		 *
		 */
		public static function onAtackFaceComplete($displayObject : DisplayObject) : void
		{
			var attackFace : AttackFace = $displayObject as AttackFace;
			if (null == attackFace)
				return;
			attackFace.recycleSub();
			attackFace.alpha = attackFace.scaleX = attackFace.scaleY = 1;
			//
			TweenLite.killTweensOf(attackFace);
			//从场景中移除
			if (attackFace != null && attackFace.parent != null)
				attackFace.parent.removeChild(attackFace);
			//池回收
			AttackFace.recycleAttackFace(attackFace);
			if(attackFace == _showAttackFaceList.getValue(attackFace.typeRes))
				_showAttackFaceList.remove(attackFace.typeRes);
		}

		//---------------------------------------------------     --------以下是运动轨迹函数----   -------------------------------------------------------//

		/**
		 * 自己伤害掉血
		 * @param attackFace 飘字对象
		 * @param $offset 偏移
		 * @param $from 开始点
		 * @param $end 结束点
		 * @param isLeftShow
		 * @param onComplete 飘字完成回调
		 *
		 */
		public static function tweenTypeMyHurt(attackFace : DisplayObject, $offset : Point, $from : Point, $end : Point, $scaleAgo : Number, $scaleLater : Number, isLeftShow : Boolean = false, onComplete : Function = null) : void
		{
			if (null == $from)
			{
				$from = new Point(0, -50);
			}
			if (null == $end)
			{
				$end = new Point(0, -200);
			}
			$from.offset($offset.x, $offset.y);
			$end.offset($offset.x, $offset.y);

			attackFace.scaleX = attackFace.scaleY = $scaleAgo;
			attackFace.alpha = 1;
			attackFace.x = (-attackFace.width >> 1) + $from.x;
			attackFace.y = $from.y;
			$end.x += (-attackFace.width >> 1);

			var timeLine : TimelineLite = new TimelineLite();
			timeLine.insert(TweenLite.to(attackFace, 0.5, {x: $end.x, y: $end.y, ease: Linear.easeNone}));
			timeLine.append(TweenLite.to(attackFace, 0.2, {scaleX: $scaleLater, scaleY: $scaleLater, alpha: 0, onComplete: onComplete, onCompleteParams: [attackFace], ease: Linear.easeInOut}));
		}

		/**
		 * 敌方扣血
		 * @param attackFace 飘字对象
		 * @param $offset 偏移
		 * @param $from 开始点
		 * @param $end 结束点
		 * @param isLeftShow
		 * @param onComplete 飘字完成回调
		 *
		 */
		public static function tweenTypeEnemyHpDecrease(attackFace : DisplayObject, $offset : Point, $from : Point, $end : Point, $scaleAgo : Number, $scaleLater : Number, isLeftShow : Boolean = false, onComplete : Function = null) : void
		{
			if (null == $from)
			{
				$from = new Point(0, -60);
			}
			if (null == $end)
			{
				$end = new Point(0, -140);
			}
			$from.offset($offset.x, $offset.y);
			$end.offset($offset.x, $offset.y);

			attackFace.scaleX = attackFace.scaleY = $scaleAgo;
			attackFace.alpha = 1;
			attackFace.x = (-attackFace.width >> 1) + $from.x;
			attackFace.y = $from.y;
			$end.x += (-attackFace.width >> 1);

			var timeLine : TimelineLite = new TimelineLite();
			timeLine.insert(TweenLite.to(attackFace, 0.5, {x: $end.x, y: $end.y, ease: Circ.easeOut}));
			timeLine.append(TweenLite.to(attackFace, 0.2, {transformAroundCenter: {scaleX: $scaleLater, scaleY: $scaleLater}, alpha: 0, onComplete: onComplete, onCompleteParams: [attackFace], ease: Linear.easeInOut}));
		}

		/**
		 * 对方伤害掉血
		 * @param attackFace 飘字对象
		 * @param $offset 偏移
		 * @param $from 开始点
		 * @param $end 结束点
		 * @param isLeftShow
		 * @param onComplete 飘字完成回调
		 *
		 */
		public static function tweenTypeEnemyHurt(attackFace : DisplayObject, $offset : Point, $from : Point, $end : Point, $scaleAgo : Number, $scaleLater : Number, isLeftShow : Boolean = false, onComplete : Function = null) : void
		{
			if (null == $from)
			{
				$from = new Point(0, -130);
			}
			if (null == $end)
			{
				$end = new Point(0, -180);
			}
			$from.offset($offset.x, $offset.y);
			$end.offset($offset.x, $offset.y);
			attackFace.scaleX = attackFace.scaleY = $scaleAgo;
			attackFace.x = (-attackFace.width >> 1) + $from.x;
			attackFace.y = $from.y;
			attackFace.scaleX = attackFace.scaleY = 0.2;
			attackFace.alpha = 1;
			$end.x += (-attackFace.width >> 1);
			var timeLine : TimelineLite = new TimelineLite();
			timeLine.insert(TweenLite.to(attackFace, 0.1, {x: $end.x, y: $end.y, scaleX: 1, scaleY: 1, ease: Linear.easeOut}));

			var tX : Number = attackFace.x + (isLeftShow ? -1 : 1) * 50;
			var tXAbs : int = Math.abs(tX) / tX;
			//执行缓动
			//然后以抛物线向左右飘50像素.
			var midPos : Point = new Point(tX, $end.y * 1.5);
			var endPos : Point = new Point(tX + tXAbs * 50, $from.y);
			timeLine.append(TweenMax.to(attackFace, 1, {scaleX: $scaleLater, scaleY: $scaleLater, alpha: 0.5, bezier: [{x: midPos.x, y: midPos.y}, {x: endPos.x, y: endPos.y}], onComplete: onComplete, onCompleteParams: [attackFace], ease: Linear.easeNone}), 0.3);
		}

		/**
		 * 属性飘字
		 * @param attackFace 飘字对象
		 * @param $offset 偏移
		 * @param $from 开始点
		 * @param $end 结束点
		 * @param isLeftShow
		 * @param onComplete 飘字完成回调
		 *
		 */
		public static function tweenTypeAttribute(attackFace : DisplayObject, $offset : Point, $from : Point, $end : Point, $scaleAgo : Number, $scaleLater : Number, isLeftShow : Boolean = false, onComplete : Function = null) : void
		{
			if (null == $from)
			{
				$from = new Point(0, -60);
			}
			if (null == $end)
			{
				$end = new Point(0, -140);
			}
			$from.offset($offset.x, $offset.y);
			$end.offset($offset.x, $offset.y);

			attackFace.scaleX = attackFace.scaleY = $scaleAgo;
			attackFace.alpha = 1;
			attackFace.x = (-attackFace.width >> 1) + $from.x;
			attackFace.y = $from.y;

			$end.x += (-attackFace.width >> 1);
			var timeLine : TimelineLite = new TimelineLite();
			timeLine.insert(TweenLite.to(attackFace, 0.9, {x: $end.x, y: $end.y, ease: Linear.easeNone}));
			timeLine.append(TweenLite.to(attackFace, 0.2, {scaleX: $scaleLater, scaleY: $scaleLater, alpha: 0, onComplete: onComplete, onCompleteParams: [attackFace], ease: Linear.easeInOut}));
		}

		/**
		 * 升级飘字
		 * @param attackFace 飘字对象
		 * @param $offset 偏移
		 * @param $from 开始点
		 * @param $end 结束点
		 * @param isLeftShow
		 * @param onComplete 飘字完成回调
		 *
		 */
		public static function tweenTypeGuJianLevelUp(attackFace : DisplayObject, $offset : Point, $from : Point, $end : Point, $scaleAgo : Number, $scaleLater : Number, isLeftShow : Boolean = false, onComplete : Function = null) : void
		{
			if (null == $from)
			{
				$from = new Point();
			}
			if (null == $end)
			{
				$end = new Point();
			}
			$from.offset($offset.x, $offset.y);
			$end.offset($offset.x, $offset.y);

			attackFace.x = (-attackFace.width >> 1) + $from.x;
			attackFace.y = $from.y;
			$end.x += (-attackFace.width >> 1);
			attackFace.alpha = 1;
			var timeLine : TimelineLite = new TimelineLite();
			timeLine.insert(TweenLite.to(attackFace, 1, {x: $end.x, y: ($end.y * 5 / 6)}));
			timeLine.append(TweenLite.to(attackFace, 0.5, {y: $end.y, alpha: 0, onComplete: onComplete, onCompleteParams: [attackFace], ease: Linear.easeInOut}));
		}

		/**
		 * 闪避
		 * @param attackFace 飘字对象
		 * @param $offset 偏移
		 * @param $from 开始点
		 * @param $end 结束点
		 * @param isLeftShow
		 * @param onComplete 飘字完成回调
		 *
		 */
		public static function tweenTypeBlink(attackFace : DisplayObject, $offset : Point, $from : Point, $end : Point, $scaleAgo : Number, $scaleLater : Number, isLeftShow : Boolean = false, onComplete : Function = null) : void
		{
			if (null == $from)
			{
				$from = new Point(-25, -85);
			}
			if (null == $end)
			{
				$end = new Point(-75, -120);
			}
			$from.offset($offset.x, $offset.y);
			$end.offset($offset.x, $offset.y);

			attackFace.scaleX = attackFace.scaleY = $scaleAgo;
			attackFace.alpha = 1;
			attackFace.x = (-attackFace.width >> 1) + $from.x;
			attackFace.y = $from.y;
			$end.x += (-attackFace.width >> 1);
			var timeLine : TimelineLite = new TimelineLite();
			timeLine.insert(TweenLite.to(attackFace, 0.7, {x: $end.x, y: $end.y, alpha: 0, ease: Linear.easeNone}));
			timeLine.append(TweenLite.to(attackFace, 0.2, {transformAroundCenter: {scaleX: $scaleLater, scaleY: $scaleLater}, alpha: 0, onComplete: onComplete, onCompleteParams: [attackFace], ease: Linear.easeInOut}));
		}

		/**
		 * 角色伤害飘字
		 * @param attackFace 飘字对象
		 * @param $offset 偏移
		 * @param $from 开始点
		 * @param $end 结束点
		 * @param isLeftShow
		 * @param onComplete 飘字完成回调
		 * @author 陈鹉光 2016-01-28
		 */
		public static function tweenTypeRoleHurt2(attackFace : DisplayObject, $offset : Point, $from : Point, $end : Point, $scaleAgo : Number, $scaleLater : Number, isLeftShow : Boolean = false, onComplete : Function = null) : void
		{
			if (null == $from)
			{
				$from = new Point(0, -50);
			}
			if (null == $end)
			{
				$end = new Point(-23, -200);
			}
			$from.offset($offset.x, $offset.y);
			$end.offset($offset.x, $offset.y);

			attackFace.scaleX = attackFace.scaleY = $scaleAgo;
			attackFace.x = (-attackFace.width >> 1) + $from.x;
			attackFace.y = $from.y - 20;

			var timeLine : TimelineLite = new TimelineLite();
			var tiltAngleNum : Number = CameraController.lockedOnPlayerController.tiltAngle; //摄像机角度
			var W : Number = attackFace.width * 0.33;
			var nextX : Number = attackFace.x + attackFace.width / 2 - W / 2; //计算attackFace缩小0.33倍之后的X坐标
			timeLine.insert(TweenLite.to(attackFace, 0.5, {x: nextX, scaleX:$scaleLater, scaleY:$scaleLater, ease: Linear.easeOut}));
			timeLine.append(TweenLite.to(attackFace, 1.2, {alpha: 0, y: $end.y + tiltAngleNum, onComplete: onComplete, onCompleteParams: [attackFace], ease: Linear.easeIn}));
		}

	}
}
