package org.mokylin.skin.app.friend
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonV3_s_sanjianniuhong;
	import org.mokylin.skin.component.button.ButtonV3_s_sanjixiaoanniu;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class FriendAddMeListItemrenderSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var cancel:feathers.controls.Button;

		public var country:feathers.controls.Label;

		public var lv:feathers.controls.Label;

		public var name:feathers.controls.Label;

		public var see:feathers.controls.Button;

		public var sure:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FriendAddMeListItemrenderSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 25;
			this.elementsContent = [bg_i(),name_i(),lv_i(),country_i(),sure_i(),cancel_i(),see_i()];
			
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
			temp.width = 483;
			temp.x = 0;
			temp.y = -1;
			return temp;
		}

		private function cancel_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			cancel = temp;
			temp.name = "cancel";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "拒绝";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_s_sanjianniuhong;
			temp.color = 0xF9F0CC;
			temp.x = 371;
			temp.y = 2;
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
			temp.width = 80;
			temp.x = 204;
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
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 50;
			temp.x = 134;
			temp.y = 3;
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
			temp.width = 129;
			temp.x = 0;
			temp.y = 3;
			return temp;
		}

		private function see_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			see = temp;
			temp.name = "see";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "查看";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_s_sanjianniuhong;
			temp.color = 0xF9F0CC;
			temp.x = 426;
			temp.y = 2;
			return temp;
		}

		private function sure_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			sure = temp;
			temp.name = "sure";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "同意";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_s_sanjixiaoanniu;
			temp.color = 0xF9F0CC;
			temp.x = 316;
			temp.y = 2;
			return temp;
		}

	}
}