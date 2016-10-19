package org.mokylin.skin.app.country.guild
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
	public class GuildEventItemrenderSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var event:feathers.controls.Label;

		public var time:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function GuildEventItemrenderSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 28;
			this.elementsContent = [bg_i(),time_i(),event_i()];
			
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
			temp.height = 28;
			temp.styleName = "ui/common/kang/liebiao_di/liebiao_di.png";
			temp.width = 865;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function event_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			event = temp;
			temp.name = "event";
			temp.bold = false;
			temp.fontSize = 14;
			temp.text = "动态事件";
			temp.textAlign = "left";
			temp.color = 0x6E3117;
			temp.width = 662;
			temp.x = 1;
			temp.y = 6;
			return temp;
		}

		private function time_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			time = temp;
			temp.name = "time";
			temp.bold = false;
			temp.fontSize = 14;
			temp.text = "时间";
			temp.textAlign = "center";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 196;
			temp.x = 665;
			temp.y = 6;
			return temp;
		}

	}
}