package org.mokylin.skin.app.windowChat
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class PlayNameItemSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var nameLab:feathers.controls.Label;

		public var state:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function PlayNameItemSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__PlayNameItemSkin_UIAsset1_i(),nameLab_i(),state_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __PlayNameItemSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/x_xuanzhongkuang/xuan_zhong_1.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function nameLab_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			nameLab = temp;
			temp.name = "nameLab";
			temp.fontSize = 14;
			temp.text = "标签";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 125;
			temp.x = 5;
			temp.y = 2;
			return temp;
		}

		private function state_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			state = temp;
			temp.name = "state";
			temp.styleName = "ui/common/version_3/B_bujian/xiuxian.png";
			temp.x = 131;
			temp.y = 7;
			return temp;
		}

	}
}