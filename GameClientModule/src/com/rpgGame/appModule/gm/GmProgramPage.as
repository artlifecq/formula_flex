package com.rpgGame.appModule.gm
{
    import com.game.engine3D.core.GameScene3D;
    import com.game.engine3D.vo.MapPointSet;
    import com.rpgGame.app.manager.GameCameraManager;
    import com.rpgGame.app.manager.GamePerformsManager;
    import com.rpgGame.app.manager.GameSetting;
    import com.rpgGame.app.manager.SceneCameraLensEffectManager;
    import com.rpgGame.app.manager.chat.NoticeManager;
    import com.rpgGame.app.manager.fight.FightFaceHelper;
    import com.rpgGame.app.manager.role.MainRoleManager;
    import com.rpgGame.app.manager.role.SceneRoleManager;
    import com.rpgGame.app.manager.scene.SceneManager;
    import com.rpgGame.app.manager.scene.SceneSwitchManager;
    import com.rpgGame.app.manager.scene.SceneTimeOfTheDayManager;
    import com.rpgGame.app.manager.time.SystemTimeManager;
    import com.rpgGame.app.scene.SceneRole;
    import com.rpgGame.app.sender.GmSender;
    import com.rpgGame.app.sender.NpcSender;
    import com.rpgGame.app.state.role.action.CollectStateReference;
    import com.rpgGame.app.state.role.control.BuffStateReference;
    import com.rpgGame.app.state.role.control.HunLuanStateReference;
    import com.rpgGame.app.state.role.control.HushStateReference;
    import com.rpgGame.app.state.role.control.StunStateReference;
    import com.rpgGame.app.state.role.control.UnmovableStateReference;
    import com.rpgGame.app.utils.Render3DTextUtil;
    import com.rpgGame.app.utils.TimeUtil;
    import com.rpgGame.core.app.AppConstant;
    import com.rpgGame.core.app.AppManager;
    import com.rpgGame.core.events.FunctionMessageBarEvent;
    import com.rpgGame.core.events.YunBiaoEvent;
    import com.rpgGame.coreData.AvatarInfo;
    import com.rpgGame.coreData.clientConfig.GmInfo;
    import com.rpgGame.coreData.info.gm.GmCommandData;
    import com.rpgGame.coreData.role.BiaoCheData;
    import com.rpgGame.coreData.role.SceneDropGoodsData;
    import com.rpgGame.coreData.role.SceneDropGoodsItem;
    import com.rpgGame.coreData.type.RenderUnitID;
    import com.rpgGame.coreData.type.RoleStateType;
    import com.rpgGame.coreData.type.SceneCharType;
    
    import flash.geom.Vector3D;
    
    import __AS3__.vec.Vector;
    
    import away3d.Away3D;
    
    import feathers.controls.ScrollContainer;
    import feathers.layout.FlowLayout;
    
    import gs.TweenLite;
    
    import org.client.mainCore.manager.EventManager;
    
    import starling.core.Starling;
    import starling.display.Sprite;

    public class GmProgramPage extends Sprite 
    {

        private var btnVect:Vector.<GmList>;
        private var _scrollContainer:ScrollContainer;
        private var msgIndex:int = 0;
        private var showIndex:int;
        private var hintNumberIndex:int = 1;

        public function GmProgramPage()
        {
            initView();
        }

        private function createCommand():void
        {
            creatLabel(1, "场景模糊", "场景模糊", "1", sceneBlur);
            creatLabel(1, "测试提示框", "测试提示框", "1", testAlert);
            creatLabel(1, "测试面板", "测试面板", "1", testPanel);
            creatLabel(1, "一键橙装", "一键橙装", "1", autoEquip);
            creatLabel(1, "测试掉落", "测试掉落", "1", testDropGoods);
            creatLabel(1, "景深开关", "景深开关", "1", useRingDepth);
            creatLabel(1, "混合开关", "混合开关", "1", blendPass);
            creatLabel(1, "进入讨逆", "进入讨逆", "1", enterTaoni);
            creatLabel(1, "进入八阵图", "进入八阵图", "1", enterBaZhentu);
            creatLabel(1, "摄像机属性", "摄像机属性", "1", printCamera);
            creatLabel(1, "随便伪装", "随便伪装", "1", camouflageEntity);
            creatLabel(1, "UI MeshStats", "UI MeshStats", "1", onStarlingMeshStats);
            creatLabel(1, "UI Stats", "UI Stats", "1", onStarlingStats);
            creatLabel(1, "技能调试", "技能调试", "1", onSpellDebug);
            creatLabel(1, "采集测试", "采集测试", "1", onShowCollect);
            creatLabel(1, "镖车换装测试", "镖车换装测试", "1", onChang);
            creatLabel(1, "帧率测试", "帧率测试", "1", onFPS);
            creatLabel(1, "显示服务器时间", "显示服务器时间", "1", onShowSysTime);
            creatLabel(1, "测试提示按钮", "显示服务器时间", "1", showMsgBtnIndex);
            creatLabel(1, "安装语音", "安装语音", "1", installVoice);
            creatLabel(1, "打开麦克风", "打开麦克风", "1", openMic);
            creatLabel(1, "关闭麦克风", "关闭麦克风", "1", closeMic);
            creatLabel(1, "开启扬声器", "开启扬声器", "1", openSpeaker);
            creatLabel(1, "关闭扬声器", "关闭扬声器", "1", closeSpeaker);
            creatLabel(2, "切换地图", "地图ID", "1", switchScene);
            creatLabel(2, "切换身体", "模型ID", "1", switchBody);
            creatLabel(2, "切换武器", "武器ID", "1", switchWeapon);
            creatLabel(2, "生成怪物", "怪物ID", "1", createMonster);
            creatLabel(2, "转换到白天", "转换秒数", "10", timeOfTheDayMorn);
            creatLabel(2, "转换到夜晚", "转换秒数", "10", timeOfTheDayNight);
            creatLabel(2, "批量材料", "材料品质", "2 100 1 0", addItems);
            creatLabel(2, "改变视野", "视野大小", "4000", changeViewRange);
            creatLabel(2, "设置", "服务器人数", "0", changeHeroCount);
            creatLabel(2, "限制数量", "玩家限制", (SceneManager.playerMaxRenderNum + ""), changeScenePlayerLimit);
            creatLabel(2, "限制数量", "怪物限制", (SceneManager.monsterMaxRenderNum + ""), changeSceneMonsterLimit);
            creatLabel(2, "限制数量", "其它限制", (SceneManager.otherMaxRenderNum + ""), changeSceneOtherLimit);
            creatLabel(2, "限制数量", "角色名限制", (SceneManager.maxRoleHeadNameNum + ""), changeRoleHeadNameLimit);
            creatLabel(2, "播放", "剧情", "0", plotById);
            creatLabel(2, "触发", "触发器", "0", triggerById);
            creatLabel(2, "指引", "指引器", "0", guideById);
            creatLabel(2, "设置", "客户端状态", "0", stateById);
            creatLabel(2, "设置", "背景抗锯齿", "4", changeScreenAntiAlias);
            creatLabel(2, "设置", "场景抗锯齿", "4", changeViewAntiAlias);
            creatLabel(2, "设置", "显示等级", "4", changeDisplayLevel);
            creatLabel(2, "设置", "近平面", "0", changeCameraNear);
            creatLabel(2, "设置", "远平面", "0", changeCameraFar);
            creatLabel(2, "显示提示", "提示类型", "1", showHint);
            creatLabel(2, "重连", "断线重连", "500", onReconnect);
            creatLabel(2, "附加", "混乱状态", "500", onHunLuan);
            creatLabel(2, "附加", "眩晕状态", "500", onStun);
            creatLabel(2, "附加", "沉默状态", "500", onHush);
            creatLabel(2, "附加", "不可移动状态", "500", onUnmovable);
            creatLabel(2, "播放", "播放特效", "tx_lianyi", onPlayUIEffect);
            creatLabel(2, "添加", "指定buff", "80301", addClientBuff);
            creatLabel(2, "冒泡", "冒泡测试", "啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊", addBubbleDialog);
            creatLabel(2, "1GM", "1GM", "", hintType1);
            creatLabel(2, "2个人重要", "2个人重要", "", hintType2);
            creatLabel(2, "3事件", "3事件", "", hintType3);
            creatLabel(2, "4中央大字", "4中央大字", "", hintType4);
            creatLabel(2, "5聊天框", "5聊天框", "", hintType5);
            creatLabel(2, "6鼠标附近", "6鼠标附近", "", hintType6);
            creatLabel(2, "101面板提示", "101面板提示", "", hintType101);
            creatLabel(2, "测试", "测试特效文字", "1", testRenderText);
            creatLabel(2, "测试", "测试动态阻挡", "1", testDynamicBlock);
            creatLabel(2, "测试", "挂机范围", "1", testTrusteeshipRange);
            creatLabel(2, "完成成就", "完成成就", "1", onFinishAchievement);
            creatLabel(2, "测试飘字", "测试飘字", "0 99999", onTestFightFace);
            creatLabel(2, "数值飘字", "数值飘字", "exp 99999", onTestAmountFace);
            creatLabel(2, "属性飘字", "属性飘字", "0 99999", onTestStatFace);
            creatLabel(2, "测试换装", "测试换装", "npc/an_npc_xiaoshuang_001/an_npc_xiaoshuang_001", onTestAvatar);
            creatLabel(2, "测试坐骑换装", "测试坐骑换装", "pc/mount/an_mount_zhanma_006_guowang", onTestMountAvatar);
            creatLabel(2, "开启msg", "开启msg", "1", showMsgBtn);
            creatLabel(2, "关闭msg", "关闭msg", "1", hideMsgBtn);
            creatLabel(2, "字符长度", "输入", "1", traceStrLen);
            creatLabel(2, "测试", "界面测试", "1", testView);
            creatLabel(2, "我是主播", "我是主播", "yl_test", anchorJoinVoice);
            creatLabel(2, "我是听众", "我是听众", "yl_test", andienceJoinVoice);
            creatLabel(2, "加入房间", "加入房间", "yl_test", joinRoom);
            creatLabel(2, "离开房间", "离开房间", "yl_test", quitRoom);
        }

        private function testView(str:String):void
        {
            TweenLite.killDelayedCallsTo(onCloseAppView);
            TweenLite.killDelayedCallsTo(onOpenAppView);
            if (str)
            {
                AppManager.showAppNoHide(str);
                TweenLite.delayedCall(1, onCloseAppView, [str]);
            };
        }

        private function onCloseAppView(str:String):void
        {
            AppManager.hideApp(str);
            TweenLite.delayedCall(1, onOpenAppView, [str]);
        }

        private function onOpenAppView(str:String):void
        {
            AppManager.showAppNoHide(str);
            TweenLite.delayedCall(1, onCloseAppView, [str]);
        }

        private function traceStrLen(str:String):void
        {
        }

        private function autoEquip():void
        {
            var _local1:Array = [242264, 242264];
        }

        private function enterBaZhentu():void
        {
            NpcSender.clickNpc(240, 0);
        }

        private function enterTaoni():void
        {
            NpcSender.clickNpc(552, 0);
        }

        private function showMsgBtn(str:String):void
        {
            EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_SHOW_TYPE, str);
        }

        private function hideMsgBtn(str:String):void
        {
            EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_HIDE_TYPE, str);
        }

        private function showMsgBtnIndex():void
        {
            EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_SHOW_TYPE, msgIndex);
            msgIndex++;
        }

        private function anchorJoinVoice(str:String):void
        {
//            GCloudVoiceManager.anchorjoinlargeroom(str, null, null, null);
        }

        private function andienceJoinVoice(str:String):void
        {
//            GCloudVoiceManager.andiencejoinlargeroom(str, null, null, null);
        }

        private function joinRoom(str:String):void
        {
//            GCloudVoiceManager.joinRoom(str, null, null, null);
        }

        private function quitRoom(str:String):void
        {
//            GCloudVoiceManager.quitRoom(str, null);
        }

        private function installVoice():void
        {
//            GCloudVoiceManager.install(null);
        }

        private function openMic():void
        {
//            GCloudVoiceManager.openMic();
        }

        private function closeMic():void
        {
//            GCloudVoiceManager.closeMic();
        }

        private function openSpeaker():void
        {
//            GCloudVoiceManager.openSpeaker();
        }

        private function closeSpeaker():void
        {
//            GCloudVoiceManager.closeSpeaker();
        }

        private function onShowSysTime():void
        {
            NoticeManager.showNotify(TimeUtil.changeTimeToSpecStr(SystemTimeManager.curtTm));
        }

        private function onTestStatFace(str:String):void
        {
            var _local2:Array = str.split(" ");
//            PlayerAttributeManager.showChgAnimation(_local2[0], _local2[1]);
        }

        private function onTestAvatar(str:String):void
        {
            var _local2:AvatarInfo = MainRoleManager.actorInfo.avatarInfo;
            _local2.clear();
            _local2.setBodyResID(str, null);
//            AvatarManager.updateAvatar(MainRoleManager.actor);
        }

        private function onTestMountAvatar(str:String):void
        {
            var _local2:AvatarInfo = MainRoleManager.actorInfo.avatarInfo;
            _local2.setMountResID(str, null);
//            AvatarManager.updateAvatar(MainRoleManager.actor);
        }

        private function onTestAmountFace(str:String):void
        {
            var _local3:int;
            var _local2:Array = str.split(" ");
            _local3 = 0;
            while (_local3 < 6)
            {
//                FightFaceHelper.showAttChange(MainRoleManager.actor, _local2[0], _local2[1]);
                _local3++;
            };
        }

        private function onTestFightFace(str:String):void
        {
            var _local2:Array = str.split(" ");
            FightFaceHelper.showHurtText(MainRoleManager.actor, MainRoleManager.actor, _local2[0], _local2[1]);
        }

        private function onFinishAchievement(str:String):void
        {
            GmSender.sendMsg(("achievement wc " + str));
        }

        private function addBubbleDialog(str:String):void
        {
            MainRoleManager.actor.dialogFace.addWordFrame("body", RenderUnitID.BODY, str, 1000);
        }

        private function addClientBuff(str:String):void
        {
//            var _local2:BuffInfo = new BuffInfo(MainRoleManager.actorID);
//            _local2.cfgId = str;
//            _local2.disappearTime = (SystemTimeManager.curtTm + 60000);
//            EventManager.dispatchEvent(BuffEvent.ADD_BUFF, _local2);
        }

        private function showHint(str:String):void
        {
//            NoticeManager.textNotify(str, (showIndex + "灌灌灌灌灌灌灌灌灌灌灌灌灌灌嘎嘎嘎嘎嘎嘎嘎嘎嘎灌灌灌灌灌灌灌灌灌灌"));
            showIndex++;
        }

        private function testPanel():void
        {
//            AppManager.showApp(AppConstant.SHI_LIAN_RELIVE_PANEL);
        }

        private function showRelivePanel():void
        {
//            AppManager.showAppNoHide(AppConstant.BACK_PACK_PANEL);
        }

        private function useRingDepth():void
        {
            GameSetting.useRingDepthOfFieldFilter = !(GameSetting.useRingDepthOfFieldFilter);
            GameCameraManager.updateCameraState();
        }

        private function blendPass():void
        {
            Away3D.BLEND_PASS = !(Away3D.BLEND_PASS);
        }

        private function printCamera():void
        {
            NoticeManager.showNotify(((("摄像机平面：far=" + SceneManager.getScene().camera.lens.far) + "，near=") + SceneManager.getScene().camera.lens.near));
        }

        private function onStarlingMeshStats():void
        {
            Starling.current.showMeshStats = !(Starling.current.showMeshStats);
        }

        private function onStarlingStats():void
        {
//            Starling.current.showStats = !(Starling.current.showStats);
        }

        private function onSpellDebug():void
        {
//            CastSpellHelper.castSpellDebug = !(CastSpellHelper.castSpellDebug);
        }

        private function onShowCollect():void
        {
            var _local1:CollectStateReference = (MainRoleManager.actor.stateMachine.getReference(CollectStateReference) as CollectStateReference);
            _local1.setParams(3000);
            MainRoleManager.actor.stateMachine.transition(RoleStateType.ACTION_COLLECT, _local1);
        }

        private function onFPS():void
        {
            NoticeManager.showNotify(((((((((((GamePerformsManager.currentFps.toFixed(0) + ",") + GamePerformsManager.seconds_10_averageFps.toFixed(0)) + ",") + GamePerformsManager.minute_1_averageFps.toFixed(0)) + ",") + GamePerformsManager.minute_5_averageFps.toFixed(0)) + ",") + GamePerformsManager.minute_10_averageFps.toFixed(0)) + ",") + GamePerformsManager.totalMemory.toFixed(0)));
        }

        private function onChang():void
        {
            var _local1:SceneRole = null;
            var _local2:BiaoCheData = MainRoleManager.actorInfo.biaoCheData;
            if (_local2 != null)
            {
                _local1 = (SceneManager.getSceneObjByID(_local2.id) as SceneRole);
                if (_local1 != null)
                {
                    if (!_local2.isBroken)
                    {
                        _local2.isBroken = true;
                        (_local1.data as BiaoCheData).isBroken = true;
                    }
                    else
                    {
                        _local2.isBroken = false;
                        (_local1.data as BiaoCheData).isBroken = false;
                    }
//                    (_local1.data as BiaoCheData).avatarInfo.setBodyResID(_local2.getModeRes(), null);
//                    AvatarManager.updateAvatar(_local1);
                    EventManager.dispatchEvent(YunBiaoEvent.UPDATE_BIAOCHE_NAME, (_local1.data as BiaoCheData));
                }
            }
        }

        private function camouflageEntity():void
        {
            var _local1:Array = null;
            if (MainRoleManager.actor.getCamouflageEntity())
            {
                MainRoleManager.actor.setCamouflageEntity(null);
            }
            else
            {
                _local1 = SceneManager.getScene().getSceneObjsByType(SceneCharType.MONSTER);
                if (_local1.length > 0)
                {
                    MainRoleManager.actor.setCamouflageEntity(_local1[0]);
                }
            }
        }

        private function testDropGoods():void
        {
            var _local7:int;
            var _local4:SceneDropGoodsItem = null;
            var _local3:Number = 10000000;
            var _local2:int = MainRoleManager.actor.x;
            var _local1:int = MainRoleManager.actor.z;
            var _local5:String = "goods/an_npc_baoxiang_001/an_npc_baoxiang_001";
            var _local8:SceneDropGoodsData = new SceneDropGoodsData();
            var _local6:Vector.<SceneDropGoodsItem> = new Vector.<SceneDropGoodsItem>();
            _local7 = 0;
            while (_local7 < 100)
            {
//                _local4 = new SceneDropGoodsItem(_local3, null);
                _local6.push(_local4);
                _local7++;
            };
            _local8.x = _local2;
            _local8.y = _local1;
            _local8.avatarRes = _local5;
//            _local8.goodsDatas = _local6;
            SceneRoleManager.getInstance().createDropGoods(_local8);
        }

        private function hintType1(str:String):void
        {
            if (str)
            {
                NoticeManager.textNotify(NoticeManager.SYSTEM_ROLL, str);
            }
            else
            {
                NoticeManager.showNotify("GM_TEST1", [hintNumberIndex]);
            };
            hintNumberIndex++;
        }

        private function hintType2(str:String):void
        {
            if (str)
            {
                NoticeManager.textNotify(NoticeManager.CENTER_BOTTOM, str);
            }
            else
            {
                NoticeManager.showNotify("GM_TEST2", [hintNumberIndex]);
            };
            hintNumberIndex++;
        }

        private function hintType3(str:String):void
        {
            if (str)
            {
//                NoticeManager.textNotify(NoticeManager.BATTLE_HINT, str);
            }
            else
            {
                NoticeManager.showNotify("GM_TEST3", [hintNumberIndex]);
            };
            hintNumberIndex++;
        }

        private function hintType4(str:String):void
        {
            if (str)
            {
                NoticeManager.textNotify(NoticeManager.SYSTEM_SWITCH, str);
            }
            else
            {
                NoticeManager.showNotify("GM_TEST4", [hintNumberIndex]);
            };
            hintNumberIndex++;
        }

        private function hintType5(str:String):void
        {
            if (str)
            {
//                NoticeManager.textNotify(NoticeManager.CHAT_SYSTEM, str);
            }
            else
            {
                NoticeManager.showNotify("GM_TEST5", [hintNumberIndex]);
            };
            hintNumberIndex++;
        }

        private function hintType6(str:String):void
        {
            if (str)
            {
                NoticeManager.textNotify(NoticeManager.MOUSE_FOLLOW_TIP, str);
            }
            else
            {
                NoticeManager.showNotify("GM_TEST6", [hintNumberIndex]);
            };
            hintNumberIndex++;
        }

        private function hintType101(str:String):void
        {
            if (str)
            {
                NoticeManager.textNotify(101, str);
            }
            else
            {
                NoticeManager.showNotify("GM_TEST101", [hintNumberIndex]);
            };
            hintNumberIndex++;
        }

        private function testRenderText(str:String):void
        {
            Render3DTextUtil.addHeadFlowerTextToTarget(MainRoleManager.actor, "tx_shuzi_meigui", "tx_shuzi_bai", 1, str, (SystemTimeManager.curtTm + 20000));
            Render3DTextUtil.addHeadFlowerTextToTarget(MainRoleManager.actor, "tx_shuzi_meigui", "tx_shuzi_bai", 2, str, (SystemTimeManager.curtTm + 10000));
        }

        private function testDynamicBlock(str:String):void
        {
            var _local4:*;
            var _local2:*;
            var _local3 = null;
            if (str == "1")
            {
                _local4 = new Vector.<MapPointSet>();
                _local2 = new Vector.<Vector3D>();
                _local2.push(new Vector3D(37454, 0, 4774));
                _local2.push(new Vector3D(37450, 0, 6200));
                _local2.push(new Vector3D(37065, 0, 6096));
                _local2.push(new Vector3D(37086, 0, 4840));
                _local4.push(new MapPointSet("MapDataDynamicObstacleArea10000", _local2));
                SceneManager.getScene().sceneMapLayer.addObstaclePoints(_local4);
            }
            else
            {
                _local3 = ["MapDataDynamicObstacleArea10000"];
                SceneManager.getScene().sceneMapLayer.removeObstaclePoints(_local3);
            };
        }

        private function testTrusteeshipRange(str:String):void
        {
//            TrusteeshipManager.getInstance().setTrusteeshipRange(str);
//            TrusteeshipManager.getInstance().showRangeEffect(true);
        }

        private function testAlert():void
        {
            NoticeManager.showNotify("allocateSalaryFail2");
        }

        private function sceneBlur():void
        {
            var _local1:GameScene3D = SceneManager.getScene();
            if (_local1.blur)
            {
                SceneManager.sceneBlur(false);
            }
            else
            {
                SceneManager.sceneBlur(true);
            };
        }

        private function timeOfTheDayMorn(sendStr:String):void
        {
            TweenLite.killTweensOf(SceneTimeOfTheDayManager);
//            TweenLite.to(SceneTimeOfTheDayManager, sendStr, {"ratio":0});
        }

        private function timeOfTheDayNight(sendStr:String):void
        {
            TweenLite.killTweensOf(SceneTimeOfTheDayManager);
//            TweenLite.to(SceneTimeOfTheDayManager, sendStr, {"ratio":1});
        }

        private function addItems(sendStr:String):void
        {
            var _local3:Array = [700, 701, 702, 703, 704, 705, 706];
            for each (var _local2:int in _local3)
            {
                GmSender.sendMsg((("goods give " + _local2) + sendStr));
            };
        }

        private function switchScene(sendStr:String):void
        {
//            MainRoleManager.actorInfo.mapID = sendStr;
            SceneSwitchManager.changeMap();
        }

        private function changeViewRange(sendStr:String):void
        {
//            SceneManager.viewDistance = sendStr;
        }

        private function changeHeroCount(sendStr:String):void
        {
            GamePerformsManager.canAdjustView = (sendStr == 0);
//            SceneManager.serverHeroCount = (((sendStr)==0) ? 20 : sendStr);
        }

        private function changeScenePlayerLimit(sendStr:String):void
        {
//            SceneManager.playerMaxRenderNum = sendStr;
        }

        private function changeSceneMonsterLimit(sendStr:String):void
        {
//            SceneManager.monsterMaxRenderNum = sendStr;
        }

        private function changeSceneOtherLimit(sendStr:String):void
        {
//            SceneManager.otherMaxRenderNum = sendStr;
        }

        private function changeRoleHeadNameLimit(sendStr:String):void
        {
//            SceneManager.maxRoleHeadNameNum = sendStr;
        }

        private function plotById(sendStr:String):void
        {
//            PlotManager.getInstance().playPlotById(sendStr);
        }

        private function triggerById(sendStr:String):void
        {
//            ClientTriggerManager.triggerById(sendStr);
        }

        private function stateById(sendStr:String):void
        {
//            ClientStateManager.setState(MainRoleManager.actor, sendStr);
        }

        private function guideById(sendStr:String):void
        {
//            ClientGuideManager.triggerById(sendStr);
        }

        private function changeScreenAntiAlias(sendStr:String):void
        {
//            Stage3DLayerManager.screenAntiAlias = sendStr;
        }

        private function changeViewAntiAlias(sendStr:String):void
        {
//            Stage3DLayerManager.viewAntiAlias = sendStr;
        }

        private function changeDisplayLevel(sendStr:String):void
        {
//            Away3D.DISPLAY_LEVEL = sendStr;
        }

        private function changeCameraNear(sendStr:String):void
        {
//            SceneManager.getScene().cameraNear = sendStr;
        }

        private function changeCameraFar(sendStr:String):void
        {
//            SceneManager.getScene().cameraFar = sendStr;
        }

        private function onReconnect(sendStr:String):void
        {
            EventManager.dispatchEvent("SERVER_RECONNECT", sendStr, "测试重连");
        }

        private function onHunLuan(sendStr:String):void
        {
            var _local2:SceneRole = MainRoleManager.actor;
            var _local3:BuffStateReference = (_local2.stateMachine.getReference(HunLuanStateReference) as HunLuanStateReference);
//            _local3.setParams((SystemTimeManager.curtTm + sendStr));
            _local2.stateMachine.transition(RoleStateType.CONTROL_HUN_LUAN, _local3);
        }

        private function onStun(sendStr:String):void
        {
            var _local2:SceneRole = MainRoleManager.actor;
            var _local3:BuffStateReference = (_local2.stateMachine.getReference(StunStateReference) as StunStateReference);
//            _local3.setParams((SystemTimeManager.curtTm + sendStr));
            _local2.stateMachine.transition(RoleStateType.CONTROL_STUN, _local3);
        }

        private function onHush(sendStr:String):void
        {
            var _local2:SceneRole = MainRoleManager.actor;
            var _local3:BuffStateReference = (_local2.stateMachine.getReference(HushStateReference) as HushStateReference);
//            _local3.setParams((SystemTimeManager.curtTm + sendStr));
            _local2.stateMachine.transition(RoleStateType.CONTROL_HUSH, _local3);
        }

        private function onUnmovable(sendStr:String):void
        {
            var _local2:SceneRole = MainRoleManager.actor;
            var _local3:UnmovableStateReference = (_local2.stateMachine.getReference(UnmovableStateReference) as UnmovableStateReference);
//            _local3.setParams((SystemTimeManager.curtTm + sendStr));
            _local2.stateMachine.transition(RoleStateType.CONTROL_UNMOVABLE, _local3);
        }

        private function onPlayUIEffect(sendStr:String):void
        {
            if (SceneCameraLensEffectManager.hasEffect(sendStr))
            {
                SceneCameraLensEffectManager.removeEffect(sendStr);
            }
            else
            {
                SceneCameraLensEffectManager.playEffectOnce(sendStr);
            };
        }

        private function switchBody(sendStr:String):void
        {
            MainRoleManager.actorInfo.avatarInfo.setBodyResID(sendStr, null);
//            AvatarManager.updateAvatar(MainRoleManager.actor);
        }

        private function switchWeapon(sendStr:String):void
        {
        }

        private function createMonster(sendStr:String):void
        {
        }

        private function initView():void
        {
            btnVect = new Vector.<GmList>();
            _scrollContainer = new ScrollContainer();
//            _scrollContainer.styleClass = VScrollBarRedSkin;
            _scrollContainer.verticalScrollBarPosition = "right";
            _scrollContainer.verticalScrollBarPosition = "right";
            _scrollContainer.horizontalScrollPolicy = "off";
            _scrollContainer.verticalScrollPolicy = "on";
            _scrollContainer.scrollBarDisplayMode = "fixed";
            _scrollContainer.layout = new FlowLayout();
            _scrollContainer.paddingLeft = 5;
            _scrollContainer.paddingRight = 5;
            _scrollContainer.paddingTop = 5;
            _scrollContainer.paddingBottom = 5;
            _scrollContainer.setSize(960, 500);
            addChild(_scrollContainer);
            createCommand();
            GMUtil.autoAlignment(btnVect);
        }

        private function creatLabel(type:int, buttonLabel:String, title:String, info:String, clickFunction:Function):void
        {
            var _local8:GmCommandData = new GmCommandData();
            var _local6:GmInfo = new GmInfo();
            _local6.type = type;
            _local6.info = info;
            _local6.buttonLabel = buttonLabel;
            _local6.title = title;
            _local8.setData(_local6);
            _local8.onClickHandler = clickFunction;
            var _local7:GmList = new GmList();
            _local7.setData(1, _local8);
            btnVect.push(_local7);
            _scrollContainer.addChild(_local7);
        }
    }
}