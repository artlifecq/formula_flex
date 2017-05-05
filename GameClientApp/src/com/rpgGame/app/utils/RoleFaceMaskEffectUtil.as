package com.rpgGame.app.utils
{
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.vo.FadeAlphaRectData;
	import com.rpgGame.app.display3D.InterAvatar3D;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.type.RenderUnitType;
	
	import flash.events.Event;
	import flash.geom.Point;
	
	import org.client.mainCore.ds.HashMap;
	
	import starling.core.Starling;
	import starling.events.EnterFrameEvent;

	/**
	 *
	 * 角色渐变遮罩效果工具
	 * @author L.L.M.Sunny
	 * 创建时间：2016-05-23 上午10:03:17
	 *
	 */
	public class RoleFaceMaskEffectUtil
	{
		private static var ZERO_POINT:Point=new Point();
		
		private static var roleMap:HashMap=new HashMap();
		private static var checkPos:Boolean;
		
		public function RoleFaceMaskEffectUtil()
		{
		}

		public static function removeFaceMaskEffect(role : SceneRole) : void
		{
			role.avatar.forEachRenderUnit(function(render : RenderUnit3D) : void
			{
				switch (render.type)
				{
					case RenderUnitType.BODY:
					case RenderUnitType.HAIR:
					case RenderUnitType.WEAPON:
					case RenderUnitType.DEPUTY_WEAPON:
					case RenderUnitType.MOUNT:
						render.removeFadeAlpha();
						break;
				}
			});
			
			roleMap.remove(role);
			if(roleMap.length==0&&checkPos){
				checkPos=false;
				Starling.current.stage.removeEventListener(Event.ENTER_FRAME,onUpdateMaskPos);
			}
		}
		
		/**
		 *添加模型遮罩 
		 * @param type 遮罩类型基于AvatarMaskType配置
		 * @param avatar 遮罩模型容器
		 * @param fadeX 遮罩水平偏移
		 * @param fadeY 遮罩垂直偏移
		 * @param scale 遮罩模型缩放
		 * @param rotationY 模型Y轴旋转
		 * 
		 */
		public static function addAvatarMask(type:String,avatar:InterAvatar3D,fadeX:int,fadeY:int,scale:Number=1,rotationY:Number=0):void
		{
			var role:SceneRole=avatar.curRole;
			if(!role){
				return;
			}
			role.avatar.forEachRenderUnit(function(render : RenderUnit3D) : void
			{
				switch (render.type)
				{
					case RenderUnitType.BODY:
					case RenderUnitType.HAIR:
					case RenderUnitType.WEAPON:
					case RenderUnitType.DEPUTY_WEAPON:
					case RenderUnitType.MOUNT:
					case RenderUnitType.WEAPON_EFFECT:
						render.addFadeAlpha(ClientConfig.getDynTexture(type));
						break;
				}
			});
			role.setScale(scale);
			role.rotationY =rotationY;
			var point : Point = avatar.parent.localToGlobal(ZERO_POINT);
			var preX:int= point.x + avatar.x+fadeX;
			var preY:int=point.y + avatar.y+fadeY;
			updateFadeAlphaRectPos(role,preX,preY );
			
			var info:MaskRoleInfo=new MaskRoleInfo();
			info.avatar=avatar;
			info.fadeX=fadeX;
			info.fadeY=fadeY;
			info.preX=preX;
			info.preY=preY;				
			roleMap.add(role,info);
			if(roleMap.length!=0&&!checkPos){
				startCheckPos();
			}
		}
		
		private static function startCheckPos():void
		{
			checkPos=true;
			Starling.current.stage.addEventListener(Event.ENTER_FRAME,onUpdateMaskPos);
		}
		
		private static function onUpdateMaskPos(event:EnterFrameEvent):void
		{
			var roles:Array=roleMap.keys();
			var infos:Array=roleMap.getValues();
			var num:int=roles.length;
			var role:SceneRole;
			var point : Point;
			var info:MaskRoleInfo;
			var preX:int;
			var preY:int;
			for(var i:int=0;i<num;i++){
				role=roles[i] as SceneRole;
				info=infos[i] as MaskRoleInfo;
				point=info.avatar.parent.localToGlobal(ZERO_POINT);
				preX= point.x + info.avatar.x+info.fadeX;
				preY=point.y + info.avatar.y+info.fadeY;
				if(preX==info.preX&&preY==info.preY){
					continue;
				}else{
					info.preX=preX;
					info.preY=preY;		
					updateFadeAlphaRectPos(role,preX,preY );
				}
			}
		}
		
		/**
		 *更新avatar的位置信息 
		 * @param avatar
		 * @param fadeX
		 * @param fadeY
		 * 
		 */
		public static function updateAvatarPos(avatar:InterAvatar3D,fadeX:int,fadeY:int):void
		{
			var role:SceneRole=avatar.curRole;
			var point : Point = avatar.parent.localToGlobal(ZERO_POINT);
			updateFadeAlphaRectPos(role, point.x + avatar.x+fadeX, point.y + avatar.y+fadeY);
		}

		public static function addDialogFaceMaskEffect(role : SceneRole) : void
		{
			role.avatar.forEachRenderUnit(function(render : RenderUnit3D) : void
			{
				switch (render.type)
				{
					case RenderUnitType.BODY:
					case RenderUnitType.HAIR:
					case RenderUnitType.WEAPON:
					case RenderUnitType.DEPUTY_WEAPON:
					case RenderUnitType.MOUNT:
					case RenderUnitType.WEAPON_EFFECT:
						render.addFadeAlpha(ClientConfig.getDynTexture("dialogFaceMask"));
						break;
				}
			});
		}

		public static function addHeadFaceMaskEffect(role : SceneRole) : void
		{
			role.avatar.forEachRenderUnit(function(render : RenderUnit3D) : void
			{
				switch (render.type)
				{
					case RenderUnitType.BODY:
					case RenderUnitType.HAIR:
					case RenderUnitType.WEAPON:
					case RenderUnitType.DEPUTY_WEAPON:
					case RenderUnitType.MOUNT:
						render.addFadeAlpha(ClientConfig.getDynTexture("headFaceMask"));
						break;
				}
			});
		}

		public static function addCountryWarHeadFaceMaskEffect(role : SceneRole) : void
		{
			role.avatar.forEachRenderUnit(function(render : RenderUnit3D) : void
			{
				switch (render.type)
				{
					case RenderUnitType.BODY:
					case RenderUnitType.HAIR:
					case RenderUnitType.WEAPON:
					case RenderUnitType.DEPUTY_WEAPON:
					case RenderUnitType.MOUNT:
						render.addFadeAlpha(ClientConfig.getDynTexture("headFaceMaskCountryWar"));
						break;
				}
			});
		}

		public static function addBossHeadFaceMaskEffect(role : SceneRole) : void
		{
			role.avatar.forEachRenderUnit(function(render : RenderUnit3D) : void
			{
				switch (render.type)
				{
					case RenderUnitType.BODY:
					case RenderUnitType.HAIR:
					case RenderUnitType.WEAPON:
					case RenderUnitType.DEPUTY_WEAPON:
					case RenderUnitType.MOUNT:
					case RenderUnitType.MOUNT:
						render.addFadeAlpha(ClientConfig.getDynTexture("bossHeadFaceMask"));
						break;
				}
			});
		}

		public static function updateFadeAlphaRectPos(role : SceneRole, x : int, y : int) : void
		{
			role.avatar.forEachRenderUnit(function(render : RenderUnit3D) : void
			{
				switch (render.type)
				{
					case RenderUnitType.BODY:
					case RenderUnitType.HAIR:
					case RenderUnitType.WEAPON:
					case RenderUnitType.DEPUTY_WEAPON:
					case RenderUnitType.MOUNT:
						render.setFadeAlphaRect(new FadeAlphaRectData(x, y, 0, 0));
						break;
				}
			});
		}

		public static function getFaceMaskX(faceMask : String) : int
		{
			var poses : Array = faceMask.split("=");
			return int(poses[0]);
		}

		public static function getFaceMaskY(faceMask : String) : int
		{
			var poses : Array = faceMask.split("=");
			return int(poses[1]);
		}

		public static function getFaceMaskScale(faceMask : String) : Number
		{
			var poses : Array = faceMask.split("=");
			return Number(poses[2]);
		}

		public static function getFaceMaskRotation(faceMask : String) : int
		{
			var poses : Array = faceMask.split("=");
			return int(poses[3]);
		}

		public static function getFaceOffsetX(faceOffset : String) : int
		{
			var poses : Array = faceOffset.split("=");
			return int(poses[0]);
		}

		public static function getFaceOffsetY(faceOffset : String) : int
		{
			var poses : Array = faceOffset.split("=");
			return int(poses[1]);
		}
	}
}
import com.rpgGame.app.display3D.InterAvatar3D;

class MaskRoleInfo{
	public var avatar:InterAvatar3D;
	public var fadeX:int;
	public var fadeY:int;
	public var preX:int;
	public var preY:int;
}
