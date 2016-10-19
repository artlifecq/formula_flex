package com.game.engine3D.vo.map
{
	import flash.utils.ByteArray;

	/**
	 *
	 * 客户端地图天色数据
	 * @author L.L.M.Sunny
	 * 创建时间：2015-12-25 下午2:03:17
	 *
	 */
	public class ClientMapTimeOfTheDayData
	{
		private var _version : int = 0;

		/**  主角同步位置灯环境光强度（白天） */
		public var mainCharSyncPosLightAmbientLevelFrom : Number;
		/**  主角同步位置灯环境光强度（夜晚） */
		public var mainCharSyncPosLightAmbientLevelTo : Number;
		/**  主角同步位置灯环境光颜色（白天） */
		public var mainCharSyncPosLightAmbientColorFrom : uint;
		/**  主角同步位置灯环境光颜色（夜晚） */
		public var mainCharSyncPosLightAmbientColorTo : uint;
		/**  主角同步位置灯漫反射强度（白天） */
		public var mainCharSyncPosLightDiffuseLevelFrom : Number;
		/**  主角同步位置灯漫反射强度（夜晚） */
		public var mainCharSyncPosLightDiffuseLevelTo : Number;
		/**  主角同步位置灯漫反射颜色（白天） */
		public var mainCharSyncPosLightDiffuseColorFrom : uint;
		/**  主角同步位置灯漫反射颜色（夜晚） */
		public var mainCharSyncPosLightDiffuseColorTo : uint;

		/**  场景区域方向灯环境光强度（白天） */
		public var sceneAreaDirectionalLightAmbientLevelFrom : Number;
		/**  场景区域方向灯环境光强度（夜晚） */
		public var sceneAreaDirectionalLightAmbientLevelTo : Number;
		/**  场景区域方向灯环境光颜色（白天） */
		public var sceneAreaDirectionalLightAmbientColorFrom : uint;
		/**  场景区域方向灯环境光颜色（夜晚） */
		public var sceneAreaDirectionalLightAmbientColorTo : uint;
		/**  场景区域方向灯漫反射强度（白天） */
		public var sceneAreaDirectionalLightDiffuseLevelFrom : Number;
		/**  场景区域方向灯漫反射强度（夜晚） */
		public var sceneAreaDirectionalLightDiffuseLevelTo : Number;
		/**  场景区域方向灯漫反射颜色（白天） */
		public var sceneAreaDirectionalLightDiffuseColorFrom : uint;
		/**  场景区域方向灯漫反射颜色（夜晚） */
		public var sceneAreaDirectionalLightDiffuseColorTo : uint;

		/**  天空雾颜色（白天） */
		public var skyFogColorFrom : uint;
		/**  天空雾颜色（夜晚） */
		public var skyFogColorTo : uint;
		/**  天空雾比例（白天） */
		public var skyFogRatioFrom : Number;
		/**  天空雾比例（夜晚） */
		public var skyFogRatioTo : Number;

		/**  环境雾颜色（白天） */
		public var fogColorFrom : uint;
		/**  环境雾颜色（夜晚） */
		public var fogColorTo : uint;
		/**  环境雾最小深度（白天） */
		public var fogMinDistanceFrom : int;
		/**  环境雾最小深度（夜晚） */
		public var fogMinDistanceTo : int;
		/**  环境雾最大深度（白天） */
		public var fogMaxDistanceFrom : int;
		/**  环境雾最大深度（夜晚） */
		public var fogMaxDistanceTo : int;
		/**  植物颜色变换（白天） */
		public var plantColorTransformFrom : Array;
		/**  植物颜色变换（夜晚） */
		public var plantColorTransformTo : Array;

		/**  夜晚消失组比例 */
		public var nightLostGroupRatio : Number;
		/**  夜晚到白天时间 */
		public var nightToMornTime : Array;
		/**  白天到夜晚时间 */
		public var mornToNightTime : Array;

		public function ClientMapTimeOfTheDayData()
		{
		}

		public function readFrom(version : int, bytes : ByteArray) : void
		{
			_version = version;
			if (_version == 0 || _version == 2)
			{
				mainCharSyncPosLightAmbientLevelFrom = bytes.readFloat();
				mainCharSyncPosLightAmbientLevelTo = bytes.readFloat();
				mainCharSyncPosLightAmbientColorFrom = bytes.readUnsignedInt();
				mainCharSyncPosLightAmbientColorTo = bytes.readUnsignedInt();
				mainCharSyncPosLightDiffuseLevelFrom = bytes.readFloat();
				mainCharSyncPosLightDiffuseLevelTo = bytes.readFloat();

				sceneAreaDirectionalLightAmbientLevelFrom = bytes.readFloat();
				sceneAreaDirectionalLightAmbientLevelTo = bytes.readFloat();
				sceneAreaDirectionalLightAmbientColorFrom = bytes.readUnsignedInt();
				sceneAreaDirectionalLightAmbientColorTo = bytes.readUnsignedInt();
				sceneAreaDirectionalLightDiffuseLevelFrom = bytes.readFloat();
				sceneAreaDirectionalLightDiffuseLevelTo = bytes.readFloat();

				skyFogColorFrom = bytes.readUnsignedInt();
				skyFogColorTo = bytes.readUnsignedInt();
				skyFogRatioFrom = bytes.readFloat();
				skyFogRatioTo = bytes.readFloat();

				if (bytes.bytesAvailable)
				{
					fogColorFrom = bytes.readUnsignedInt();
					fogColorTo = bytes.readUnsignedInt();
					fogMinDistanceFrom = bytes.readInt();
					fogMinDistanceTo = bytes.readInt();
					fogMaxDistanceFrom = bytes.readInt();
					fogMaxDistanceTo = bytes.readInt();

					mainCharSyncPosLightDiffuseColorFrom = bytes.readUnsignedInt();
					mainCharSyncPosLightDiffuseColorTo = bytes.readUnsignedInt();
					sceneAreaDirectionalLightDiffuseColorFrom = bytes.readUnsignedInt();
					sceneAreaDirectionalLightDiffuseColorTo = bytes.readUnsignedInt();
				}

				var i : int;
				var len : int = 0;
				var arr : Array;
				if (bytes.bytesAvailable)
				{
					arr = [];
					len = bytes.readByte();
					for (i = 0; i < len; i++)
					{
						arr.push(bytes.readFloat().toFixed(2));
					}
					plantColorTransformFrom = arr;

					arr = [];
					len = bytes.readByte();
					for (i = 0; i < len; i++)
					{
						arr.push(bytes.readFloat().toFixed(2));
					}
					plantColorTransformTo = arr;
				}

				var times : Array;
				if (bytes.bytesAvailable)
				{
					nightLostGroupRatio = bytes.readFloat();
					times = [];
					times.push(bytes.readInt());
					times.push(bytes.readInt());
					mornToNightTime = times;
					times = [];
					times.push(bytes.readInt());
					times.push(bytes.readInt());
					nightToMornTime = times;
				}
			}
		}
	}
}
