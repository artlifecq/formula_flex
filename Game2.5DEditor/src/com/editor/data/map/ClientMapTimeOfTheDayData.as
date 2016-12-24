package com.editor.data.map
{
	import com.editor.cfg.ConfigData;
	import com.game.engine3D.utils.TimeUtil;

	import flash.utils.ByteArray;

	/**
	 *
	 * 客户端地图天色数据
	 * @author L.L.M.Sunny
	 * 创建时间：2015-12-25 下午2:03:17
	 *
	 */
	dynamic public class ClientMapTimeOfTheDayData extends ConfigData
	{
		private var _version : int = 0;

		public function ClientMapTimeOfTheDayData()
		{
			super();
			this["mainCharSyncPosLightAmbientLevelFrom"] = 0;
			this["mainCharSyncPosLightAmbientLevelTo"] = 0;
			this["mainCharSyncPosLightAmbientColorFrom"] = 0;
			this["mainCharSyncPosLightAmbientColorTo"] = 0;
			this["mainCharSyncPosLightDiffuseLevelFrom"] = 0;
			this["mainCharSyncPosLightDiffuseLevelTo"] = 0;
			this["sceneAreaDirectionalLightAmbientLevelFrom"] = 0;
			this["sceneAreaDirectionalLightAmbientLevelTo"] = 0;
			this["sceneAreaDirectionalLightAmbientColorFrom"] = 0;
			this["sceneAreaDirectionalLightAmbientColorTo"] = 0;
			this["sceneAreaDirectionalLightDiffuseLevelFrom"] = 0;
			this["sceneAreaDirectionalLightDiffuseLevelTo"] = 0;
			//====================
			this["skyFogColorFrom"] = 0;
			this["skyFogColorTo"] = 0;
			this["skyFogRatioFrom"] = 0;
			this["skyFogRatioTo"] = 0;
			//====================
			this["fogColorFrom"] = 0;
			this["fogColorTo"] = 0;
			this["fogMinDistanceFrom"] = 0;
			this["fogMinDistanceTo"] = 0;
			this["fogMaxDistanceFrom"] = 0;
			this["fogMaxDistanceTo"] = 0;
			//====================
			this["mainCharSyncPosLightDiffuseColorFrom"] = 0;
			this["mainCharSyncPosLightDiffuseColorTo"] = 0;
			this["sceneAreaDirectionalLightDiffuseColorFrom"] = 0;
			this["sceneAreaDirectionalLightDiffuseColorTo"] = 0;
			//====================
			this["plantColorTransformFrom"] = "0,0,0,0";
			this["plantColorTransformTo"] = "0,0,0,0";
			//====================
			this["nightLostGroupRatio"] = 0;
			this["nightToMornTime"] = "00:00-00:00";
			this["mornToNightTime"] = "00:00-00:00";

			//====================
			name = "场景天色参数";
		}

		/** 主角同步位置灯环境光强度（白天） */
		public function get mMainCharSyncPosLightAmbientLevelFrom() : Number
		{
			return this["mainCharSyncPosLightAmbientLevelFrom"];
		}

		public function set mMainCharSyncPosLightAmbientLevelFrom(value : Number) : void
		{
			this["mainCharSyncPosLightAmbientLevelFrom"] = value.toFixed(2);
		}

		/**  主角同步位置灯环境光强度（夜晚） */
		public function get mMainCharSyncPosLightAmbientLevelTo() : Number
		{
			return this["mainCharSyncPosLightAmbientLevelTo"];
		}

		public function set mMainCharSyncPosLightAmbientLevelTo(value : Number) : void
		{
			this["mainCharSyncPosLightAmbientLevelTo"] = value.toFixed(2);
		}

		/**  主角同步位置灯环境光颜色（白天） */
		public function get mMainCharSyncPosLightAmbientColorFrom() : uint
		{
			return this["mainCharSyncPosLightAmbientColorFrom"];
		}

		public function set mMainCharSyncPosLightAmbientColorFrom(value : uint) : void
		{
			this["mainCharSyncPosLightAmbientColorFrom"] = value;
		}

		/**  主角同步位置灯环境光颜色（夜晚） */
		public function get mMainCharSyncPosLightAmbientColorTo() : uint
		{
			return this["mainCharSyncPosLightAmbientColorTo"];
		}

		public function set mMainCharSyncPosLightAmbientColorTo(value : uint) : void
		{
			this["mainCharSyncPosLightAmbientColorTo"] = value;
		}

		/** 主角同步位置灯漫反射强度（白天） */
		public function get mMainCharSyncPosLightDiffuseLevelFrom() : Number
		{
			return this["mainCharSyncPosLightDiffuseLevelFrom"];
		}

		public function set mMainCharSyncPosLightDiffuseLevelFrom(value : Number) : void
		{
			this["mainCharSyncPosLightDiffuseLevelFrom"] = value.toFixed(2);
		}

		/**  主角同步位置灯漫反射强度（夜晚） */
		public function get mMainCharSyncPosLightDiffuseLevelTo() : Number
		{
			return this["mainCharSyncPosLightDiffuseLevelTo"];
		}

		public function set mMainCharSyncPosLightDiffuseLevelTo(value : Number) : void
		{
			this["mainCharSyncPosLightDiffuseLevelTo"] = value.toFixed(2);
		}

		/**  主角同步位置灯漫反射颜色（白天） */
		public function get mMainCharSyncPosLightDiffuseColorFrom() : uint
		{
			return this["mainCharSyncPosLightDiffuseColorFrom"];
		}

		public function set mMainCharSyncPosLightDiffuseColorFrom(value : uint) : void
		{
			this["mainCharSyncPosLightDiffuseColorFrom"] = value;
		}

		/**  主角同步位置灯漫反射颜色（夜晚） */
		public function get mMainCharSyncPosLightDiffuseColorTo() : uint
		{
			return this["mainCharSyncPosLightDiffuseColorTo"];
		}

		public function set mMainCharSyncPosLightDiffuseColorTo(value : uint) : void
		{
			this["mainCharSyncPosLightDiffuseColorTo"] = value;
		}

		/**  场景区域方向灯环境光强度（白天） */
		public function get mSceneAreaDirectionalLightAmbientLevelFrom() : Number
		{
			return this["sceneAreaDirectionalLightAmbientLevelFrom"];
		}

		public function set mSceneAreaDirectionalLightAmbientLevelFrom(value : Number) : void
		{
			this["sceneAreaDirectionalLightAmbientLevelFrom"] = value.toFixed(2);
		}

		/**  场景区域方向灯环境光强度（夜晚） */
		public function get mSceneAreaDirectionalLightAmbientLevelTo() : Number
		{
			return this["sceneAreaDirectionalLightAmbientLevelTo"];
		}

		public function set mSceneAreaDirectionalLightAmbientLevelTo(value : Number) : void
		{
			this["sceneAreaDirectionalLightAmbientLevelTo"] = value.toFixed(2);
		}

		/**  场景区域方向灯环境光颜色（白天） */
		public function get mSceneAreaDirectionalLightAmbientColorFrom() : uint
		{
			return this["sceneAreaDirectionalLightAmbientColorFrom"];
		}

		public function set mSceneAreaDirectionalLightAmbientColorFrom(value : uint) : void
		{
			this["sceneAreaDirectionalLightAmbientColorFrom"] = value;
		}

		/**  场景区域方向灯环境光颜色（夜晚） */
		public function get mSceneAreaDirectionalLightAmbientColorTo() : uint
		{
			return this["sceneAreaDirectionalLightAmbientColorTo"];
		}

		public function set mSceneAreaDirectionalLightAmbientColorTo(value : uint) : void
		{
			this["sceneAreaDirectionalLightAmbientColorTo"] = value;
		}

		/** 场景区域方向灯漫反射强度（白天） */
		public function get mSceneAreaDirectionalLightDiffuseLevelFrom() : Number
		{
			return this["sceneAreaDirectionalLightDiffuseLevelFrom"];
		}

		public function set mSceneAreaDirectionalLightDiffuseLevelFrom(value : Number) : void
		{
			this["sceneAreaDirectionalLightDiffuseLevelFrom"] = value.toFixed(2);
		}

		/**  场景区域方向灯漫反射强度（夜晚） */
		public function get mSceneAreaDirectionalLightDiffuseLevelTo() : Number
		{
			return this["sceneAreaDirectionalLightDiffuseLevelTo"];
		}

		public function set mSceneAreaDirectionalLightDiffuseLevelTo(value : Number) : void
		{
			this["sceneAreaDirectionalLightDiffuseLevelTo"] = value.toFixed(2);
		}

		/**  场景区域方向灯漫反射颜色（白天） */
		public function get mSceneAreaDirectionalLightDiffuseColorFrom() : uint
		{
			return this["sceneAreaDirectionalLightDiffuseColorFrom"];
		}

		public function set mSceneAreaDirectionalLightDiffuseColorFrom(value : uint) : void
		{
			this["sceneAreaDirectionalLightDiffuseColorFrom"] = value;
		}

		/**  场景区域方向灯漫反射颜色（夜晚） */
		public function get mSceneAreaDirectionalLightDiffuseColorTo() : uint
		{
			return this["sceneAreaDirectionalLightDiffuseColorTo"];
		}

		public function set mSceneAreaDirectionalLightDiffuseColorTo(value : uint) : void
		{
			this["sceneAreaDirectionalLightDiffuseColorTo"] = value;
		}

		/**  天空雾颜色（白天） */
		public function get mSkyFogColorFrom() : uint
		{
			return this["skyFogColorFrom"];
		}

		public function set mSkyFogColorFrom(value : uint) : void
		{
			this["skyFogColorFrom"] = value;
		}

		/**  天空雾颜色（夜晚） */
		public function get mSkyFogColorTo() : uint
		{
			return this["skyFogColorTo"];
		}

		public function set mSkyFogColorTo(value : uint) : void
		{
			this["skyFogColorTo"] = value;
		}

		/**  天空雾比例（白天） */
		public function get mSkyFogRatioFrom() : Number
		{
			return this["skyFogRatioFrom"];
		}

		public function set mSkyFogRatioFrom(value : Number) : void
		{
			this["skyFogRatioFrom"] = value.toFixed(2);
		}

		/**  天空雾比例（夜晚） */
		public function get mSkyFogRatioTo() : Number
		{
			return this["skyFogRatioTo"];
		}

		public function set mSkyFogRatioTo(value : Number) : void
		{
			this["skyFogRatioTo"] = value.toFixed(2);
		}

		/**  环境雾颜色（夜晚） */
		public function get mFogColorFrom() : uint
		{
			return this["fogColorFrom"];
		}

		public function set mFogColorFrom(value : uint) : void
		{
			this["fogColorFrom"] = value;
		}

		/**  环境雾颜色（白天） */
		public function get mFogColorTo() : uint
		{
			return this["fogColorTo"];
		}

		public function set mFogColorTo(value : uint) : void
		{
			this["fogColorTo"] = value;
		}

		/**  环境雾最小深度（白天） */
		public function get mFogMinDistanceFrom() : int
		{
			return this["fogMinDistanceFrom"];
		}

		public function set mFogMinDistanceFrom(value : int) : void
		{
			this["fogMinDistanceFrom"] = value;
		}

		/**  环境雾最小深度（夜晚） */
		public function get mFogMinDistanceTo() : int
		{
			return this["fogMinDistanceTo"];
		}

		public function set mFogMinDistanceTo(value : int) : void
		{
			this["fogMinDistanceTo"] = value;
		}

		/**  环境雾最大深度（白天） */
		public function get mFogMaxDistanceFrom() : int
		{
			return this["fogMaxDistanceFrom"];
		}

		public function set mFogMaxDistanceFrom(value : int) : void
		{
			this["fogMaxDistanceFrom"] = value;
		}

		/**  环境雾最大深度（夜晚） */
		public function get mFogMaxDistanceTo() : int
		{
			return this["fogMaxDistanceTo"];
		}

		public function set mFogMaxDistanceTo(value : int) : void
		{
			this["fogMaxDistanceTo"] = value;
		}

		/**  植物颜色变换（白天） */
		public function get mPlantColorTransformFrom() : Array
		{
			return String(this["plantColorTransformFrom"]).split(",");
		}

		public function set mPlantColorTransformFrom(value : Array) : void
		{
			this["plantColorTransformFrom"] = value.join(",");
		}

		/**  植物颜色变换（夜晚） */
		public function get mPlantColorTransformTo() : Array
		{
			return String(this["plantColorTransformTo"]).split(",");
		}

		public function set mPlantColorTransformTo(value : Array) : void
		{
			this["plantColorTransformTo"] = value.join(",");
		}

		/**  夜晚消失组比例 */
		public function get mNightLostGroupRatio() : Number
		{
			return this["nightLostGroupRatio"];
		}

		public function set mNightLostGroupRatio(value : Number) : void
		{
			this["nightLostGroupRatio"] = value.toFixed(2);
		}

		/**  夜晚到白天时间 */
		public function get mNightToMornTime() : Array
		{
			var timeStrs : Array = String(this["nightToMornTime"]).split("-");
			var times : Array = (timeStrs[0] ? String(timeStrs[0]).split(":") : null);
			var fromTime : int = 0;
			if (times && times.length == 2)
			{
				fromTime = int(times[0]) * TimeUtil.HOUR_MICRO_SECONDS + int(times[1]) * TimeUtil.MINUTE_MICRO_SECONDS;
			}
			var toTime : int = 0;
			times = (timeStrs[1] ? String(timeStrs[1]).split(":") : null);
			if (times && times.length == 2)
			{
				toTime = int(times[0]) * TimeUtil.HOUR_MICRO_SECONDS + int(times[1]) * TimeUtil.MINUTE_MICRO_SECONDS;
			}
			return [fromTime, toTime];
		}

		public function set mNightToMornTime(value : Array) : void
		{
			var timeMinute : int = int(value[0] / TimeUtil.MINUTE_MICRO_SECONDS);
			var hour : int = int(timeMinute / 60);
			var minute : int = timeMinute % 60;
			var fromTime : String = (hour >= 10 ? "" : "0") + hour + ":" + (minute >= 10 ? "" : "0") + minute;

			timeMinute = int(value[1] / TimeUtil.MINUTE_MICRO_SECONDS);
			hour = int(timeMinute / 60);
			minute = timeMinute % 60;
			var toTime : String = (hour >= 10 ? "" : "0") + hour + ":" + (minute >= 10 ? "" : "0") + minute;

			this["nightToMornTime"] = fromTime + "-" + toTime;
		}

		/**  白天到夜晚时间 */
		public function get mMornToNightTime() : Array
		{
			var timeStrs : Array = String(this["mornToNightTime"]).split("-");
			var times : Array = (timeStrs[0] ? String(timeStrs[0]).split(":") : null);
			var fromTime : int = 0;
			if (times && times.length == 2)
			{
				fromTime = int(times[0]) * TimeUtil.HOUR_MICRO_SECONDS + int(times[1]) * TimeUtil.MINUTE_MICRO_SECONDS;
			}
			var toTime : int = 0;
			times = (timeStrs[1] ? String(timeStrs[1]).split(":") : null);
			if (times && times.length == 2)
			{
				toTime = int(times[0]) * TimeUtil.HOUR_MICRO_SECONDS + int(times[1]) * TimeUtil.MINUTE_MICRO_SECONDS;
			}
			return [fromTime, toTime];
		}

		public function set mMornToNightTime(value : Array) : void
		{
			var timeMinute : int = int(value[0] / TimeUtil.MINUTE_MICRO_SECONDS);
			var hour : int = int(timeMinute / 60);
			var minute : int = timeMinute % 60;
			var fromTime : String = (hour >= 10 ? "" : "0") + hour + ":" + (minute >= 10 ? "" : "0") + minute;

			timeMinute = int(value[1] / TimeUtil.MINUTE_MICRO_SECONDS);
			hour = int(timeMinute / 60);
			minute = timeMinute % 60;
			var toTime : String = (hour >= 10 ? "" : "0") + hour + ":" + (minute >= 10 ? "" : "0") + minute;

			this["mornToNightTime"] = fromTime + "-" + toTime;
		}

		public function writeTo(bytes : ByteArray) : void
		{
			bytes.writeFloat(mMainCharSyncPosLightAmbientLevelFrom);
			bytes.writeFloat(mMainCharSyncPosLightAmbientLevelTo);
			bytes.writeUnsignedInt(mMainCharSyncPosLightAmbientColorFrom);
			bytes.writeUnsignedInt(mMainCharSyncPosLightAmbientColorTo);
			bytes.writeFloat(mMainCharSyncPosLightDiffuseLevelFrom);
			bytes.writeFloat(mMainCharSyncPosLightDiffuseLevelTo);

			bytes.writeFloat(mSceneAreaDirectionalLightAmbientLevelFrom);
			bytes.writeFloat(mSceneAreaDirectionalLightAmbientLevelTo);
			bytes.writeUnsignedInt(mSceneAreaDirectionalLightAmbientColorFrom);
			bytes.writeUnsignedInt(mSceneAreaDirectionalLightAmbientColorTo);
			bytes.writeFloat(mSceneAreaDirectionalLightDiffuseLevelFrom);
			bytes.writeFloat(mSceneAreaDirectionalLightDiffuseLevelTo);

			bytes.writeUnsignedInt(mSkyFogColorFrom);
			bytes.writeUnsignedInt(mSkyFogColorTo);
			bytes.writeFloat(mSkyFogRatioFrom);
			bytes.writeFloat(mSkyFogRatioTo);

			bytes.writeUnsignedInt(mFogColorFrom);
			bytes.writeUnsignedInt(mFogColorTo);
			bytes.writeInt(mFogMinDistanceFrom);
			bytes.writeInt(mFogMinDistanceTo);
			bytes.writeInt(mFogMaxDistanceFrom);
			bytes.writeInt(mFogMaxDistanceTo);

			bytes.writeUnsignedInt(mMainCharSyncPosLightDiffuseColorFrom);
			bytes.writeUnsignedInt(mMainCharSyncPosLightDiffuseColorTo);
			bytes.writeUnsignedInt(mSceneAreaDirectionalLightDiffuseColorFrom);
			bytes.writeUnsignedInt(mSceneAreaDirectionalLightDiffuseColorTo);

			var i : int;
			var len : int = 0;
			var arr : Array;
			arr = mPlantColorTransformFrom;
			len = arr.length;
			bytes.writeByte(len);
			for (i = 0; i < len; i++)
			{
				bytes.writeFloat(parseFloat(Number(arr[i]).toFixed(2)));
			}

			arr = mPlantColorTransformTo;
			len = arr.length;
			bytes.writeByte(len);
			for (i = 0; i < len; i++)
			{
				bytes.writeFloat(parseFloat(Number(arr[i]).toFixed(2)));
			}

			var times : Array;
			bytes.writeFloat(mNightLostGroupRatio);
			times = mMornToNightTime;
			bytes.writeInt(times[0]);
			bytes.writeInt(times[1]);
			times = mNightToMornTime;
			bytes.writeInt(times[0]);
			bytes.writeInt(times[1]);
		}

		public function readFrom(version : int, bytes : ByteArray) : void
		{
			_version = version;
			if (_version == 0 || _version == 2)
			{
				mMainCharSyncPosLightAmbientLevelFrom = bytes.readFloat();
				mMainCharSyncPosLightAmbientLevelTo = bytes.readFloat();
				mMainCharSyncPosLightAmbientColorFrom = bytes.readUnsignedInt();
				mMainCharSyncPosLightAmbientColorTo = bytes.readUnsignedInt();
				mMainCharSyncPosLightDiffuseLevelFrom = bytes.readFloat();
				mMainCharSyncPosLightDiffuseLevelTo = bytes.readFloat();

				mSceneAreaDirectionalLightAmbientLevelFrom = bytes.readFloat();
				mSceneAreaDirectionalLightAmbientLevelTo = bytes.readFloat();
				mSceneAreaDirectionalLightAmbientColorFrom = bytes.readUnsignedInt();
				mSceneAreaDirectionalLightAmbientColorTo = bytes.readUnsignedInt();
				mSceneAreaDirectionalLightDiffuseLevelFrom = bytes.readFloat();
				mSceneAreaDirectionalLightDiffuseLevelTo = bytes.readFloat();

				mSkyFogColorFrom = bytes.readUnsignedInt();
				mSkyFogColorTo = bytes.readUnsignedInt();
				mSkyFogRatioFrom = bytes.readFloat();
				mSkyFogRatioTo = bytes.readFloat();

				if (bytes.bytesAvailable)
				{
					mFogColorFrom = bytes.readUnsignedInt();
					mFogColorTo = bytes.readUnsignedInt();
					mFogMinDistanceFrom = bytes.readInt();
					mFogMinDistanceTo = bytes.readInt();
					mFogMaxDistanceFrom = bytes.readInt();
					mFogMaxDistanceTo = bytes.readInt();

					mMainCharSyncPosLightDiffuseColorFrom = bytes.readUnsignedInt();
					mMainCharSyncPosLightDiffuseColorTo = bytes.readUnsignedInt();
					mSceneAreaDirectionalLightDiffuseColorFrom = bytes.readUnsignedInt();
					mSceneAreaDirectionalLightDiffuseColorTo = bytes.readUnsignedInt();
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
					mPlantColorTransformFrom = arr;

					arr = [];
					len = bytes.readByte();
					for (i = 0; i < len; i++)
					{
						arr.push(bytes.readFloat().toFixed(2));
					}
					mPlantColorTransformTo = arr;
				}

				var times : Array;
				if (bytes.bytesAvailable)
				{
					mNightLostGroupRatio = bytes.readFloat();
					times = [];
					times.push(bytes.readInt());
					times.push(bytes.readInt());
					mMornToNightTime = times;
					times = [];
					times.push(bytes.readInt());
					times.push(bytes.readInt());
					mNightToMornTime = times;
				}
			}
		}
	}
}
