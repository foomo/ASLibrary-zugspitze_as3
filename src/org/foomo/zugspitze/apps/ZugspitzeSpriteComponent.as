/*
 * This file is part of the foomo Opensource Framework.
 *
 * The foomo Opensource Framework is free software: you can redistribute it
 * and/or modify it under the terms of the GNU Lesser General Public License as
 * published  by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 *
 * The foomo Opensource Framework is distributed in the hope that it will
 * be useful, but WITHOUT ANY WARRANTY; without even the implied warranty
 * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License along with
 * the foomo Opensource Framework. If not, see <http://www.gnu.org/licenses/>.
 */
package org.foomo.zugspitze.apps
{
	import org.foomo.zugspitze.core.ZugspitzeController;
	import org.foomo.zugspitze.core.ZugspitzeModel;
	import org.foomo.zugspitze.core.Zugspitze;
	import org.foomo.zugspitze.events.ZugspitzeEvent;

	import flash.display.DisplayObject;
	import flash.display.Sprite;

	[Event(name="zugspitzeControllerChanged", type="org.foomo.zugspitze.events.ZugspitzeEvent")]
	[Event(name="zugspitzeModelChanged", type="org.foomo.zugspitze.events.ZugspitzeEvent")]
	[Event(name="zugspitzeViewChanged", type="org.foomo.zugspitze.events.ZugspitzeEvent")]
	[Event(name="zugspitzeViewRemove", type="org.foomo.zugspitze.events.ZugspitzeEvent")]
	[Event(name="zugspitzeViewAdd", type="org.foomo.zugspitze.events.ZugspitzeEvent")]

	/**
	 * Zuspitzimplementation extending Sprite
	 *
	 * @link    http://www.foomo.org
	 * @license http://www.gnu.org/licenses/lgpl.txt
	 * @author  franklin <franklin@weareinteractive.com>
	 */
	public class ZugspitzeSpriteComponent extends Sprite implements IApplication
	{
		//-----------------------------------------------------------------------------------------
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		/**
		 * @private
		 */
		private var _zugspitze:Zugspitze;

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function ZugspitzeSpriteComponent()
		{
			super();
			this._zugspitze = new Zugspitze(this);
			this._zugspitze.addEventListener(ZugspitzeEvent.ZUGSPITZE_VIEW_CHANGED, this.zugspitzeEventHandler, false, 0, true)
			this._zugspitze.addEventListener(ZugspitzeEvent.ZUGSPITZE_VIEW_ADD, this.zugspitzeEventHandler, false, 0, true)
			this._zugspitze.addEventListener(ZugspitzeEvent.ZUGSPITZE_VIEW_REMOVE, this.zugspitzeEventHandler, false, 0, true)
			this._zugspitze.addEventListener(ZugspitzeEvent.ZUGSPITZE_MODEL_CHANGED, this.zugspitzeEventHandler, false, 0, true)
			this._zugspitze.addEventListener(ZugspitzeEvent.ZUGSPITZE_CONTROLLER_CHANGED, this.zugspitzeEventHandler, false, 0, true)
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 * Define Controller Class
		 */
		public function set controllerClass(value:Class):void
		{
			this._zugspitze.controllerClass = value;
		}

		/**
		 * Define Model Class
		 */
		public function set modelClass(value:Class):void
		{
			this._zugspitze.modelClass = value;
		}

		/**
		 * Define View Class
		 */
		public function set viewClass(value:Class):void
		{
			this._zugspitze.viewClass = value;
		}

		/**
		 * Set Controller instance
		 */
		public function set controller(value:ZugspitzeController):void
		{
			this._zugspitze.controller = value;
		}

		/**
		 * Set Model instance
		 */
		public function set model(value:ZugspitzeModel):void
		{
			this._zugspitze.model = value;
		}

		/**
		 * Set View instance
		 */
		public function set view(value:DisplayObject):void
		{
			this._zugspitze.view = value;
		}

		/**
		 * Returns Implementation instance
		 */
		public function get application():IApplication
		{
			return this._zugspitze.application;
		}

		/**
		 * Returns Controller instance
		 */
		public function get controller():ZugspitzeController
		{
			return this._zugspitze.controller;
		}

		/**
		 * Returns Model instance
		 */
		public function get model():ZugspitzeModel
		{
			return this._zugspitze.model;
		}

		/**
		 * Returns View instance
		 */
		public function get view():DisplayObject
		{
			return this._zugspitze.view;
		}

		//-----------------------------------------------------------------------------------------
		// ~ Pirvate eventhandler
		//-----------------------------------------------------------------------------------------

		/**
		 * @private
		 */
		private function zugspitzeEventHandler(event:ZugspitzeEvent):void
		{
			this.dispatchEvent(event);
		}
	}
}