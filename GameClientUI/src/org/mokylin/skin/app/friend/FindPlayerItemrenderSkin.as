package org.mokylin.skin.app.friend
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
	public class FindPlayerItemrenderSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var country:feathers.controls.Label;

		public var lv:feathers.controls.Label;

		public var name:feathers.controls.Label;

		public var select:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FindPlayerItemrenderSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 25;
			this.elementsContent = [select_i(),bg_i(),name_i(),lv_i(),country_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 25;
			temp.styleName = "ui/common/kang/liebiao_di/liebiao_di.png";
			temp.width = 333;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function country_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			country = temp;
			temp.name = "country";
			temp.text = "国家";
			temp.textAlign = "center";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 87;
			temp.x = 225;
			temp.y = 4;
			return temp;
		}

		private function lv_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lv = temp;
			temp.name = "lv";
			temp.text = "等级";
			temp.textAlign = "center";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 69;
			temp.x = 137;
			temp.y = 4;
			return temp;
		}

		private function name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			name = temp;
			temp.name = "name";
			temp.text = "玩家名称";
			temp.textAlign = "center";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 116;
			temp.x = 5;
			temp.y = 3;
			return temp;
		}

		private function select_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			select = temp;
			temp.name = "select";
			temp.height = 25;
			temp.left = 0;
			temp.styleName = "ui/app/friend/list_down.png";
			temp.top = 0;
			temp.width = 333;
			return temp;
		}

	}
}