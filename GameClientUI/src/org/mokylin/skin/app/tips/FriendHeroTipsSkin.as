package org.mokylin.skin.app.tips
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class FriendHeroTipsSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var haoyoudu:feathers.controls.Label;

		public var imgBG:feathers.controls.UIAsset;

		public var isFriend:feathers.controls.UIAsset;

		public var labLine:feathers.controls.Label;

		public var labName:feathers.controls.Label;

		public var level:feathers.controls.Label;

		public var tipsGroup:feathers.controls.Group;

		public var xinqin:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FriendHeroTipsSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [imgBG_i(),isFriend_i(),tipsGroup_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __FriendHeroTipsSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "等级：";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 21;
			return temp;
		}

		private function haoyoudu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			haoyoudu = temp;
			temp.name = "haoyoudu";
			temp.text = "好友度：";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 245;
			temp.x = 0;
			temp.y = 42;
			return temp;
		}

		private function imgBG_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBG = temp;
			temp.name = "imgBG";
			temp.height = 93;
			temp.styleName = "ui/common/version_3/S_shurukuang/shu_ru_kuang_2.png";
			temp.width = 268;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function isFriend_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			isFriend = temp;
			temp.name = "isFriend";
			temp.styleName = "ui/common/version_3/B_bujian/hao-you-icon.png";
			temp.x = 8;
			temp.y = 6;
			return temp;
		}

		private function labLine_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labLine = temp;
			temp.name = "labLine";
			temp.height = 16;
			temp.text = "[在线]";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 55;
			temp.x = 23;
			temp.y = 0;
			return temp;
		}

		private function labName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labName = temp;
			temp.name = "labName";
			temp.bold = false;
			temp.height = 16;
			temp.fontSize = 14;
			temp.text = "名字有七个字啊";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 163;
			temp.x = 67;
			temp.y = 0;
			return temp;
		}

		private function level_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			level = temp;
			temp.name = "level";
			temp.text = "88级";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 117;
			temp.x = 35;
			temp.y = 21;
			return temp;
		}

		private function tipsGroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			tipsGroup = temp;
			temp.name = "tipsGroup";
			temp.x = 8;
			temp.y = 9;
			temp.elementsContent = [labName_i(),labLine_i(),__FriendHeroTipsSkin_Label1_i(),level_i(),xinqin_i(),haoyoudu_i()];
			return temp;
		}

		private function xinqin_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			xinqin = temp;
			temp.name = "xinqin";
			temp.text = "心情";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 245;
			temp.x = 0;
			temp.y = 60;
			return temp;
		}

	}
}