module Api
  module V1
    class EmployeeController < ApplicationController
      before_action :authenticate_request
      def index
        employees = Employee.order("created_at ASC").limit(params[:limit]).offset(params[:offset])
        render json: { employees: employees }
      end

      def show
        begin
          employee = Employee.find_by(id: params[:id])
          Rails.logger.info "&&&&&&&&&&&: #{employee}"
          if employee
            render json: {status: 'SUCCESS', data: employee}, status: :ok
          else
            render json: {status: 'Not Found', msg: 'employee Id not found', data: nil}, status: :not_found
            return
          end
        rescue => e
          render json: {status: 'Internal Server Error', msg: e, data: nil}, status: :internal_server_error
        end
      end

      def create
        begin
            employee = Employee.new(employee_params)
            if employee.save
                render json: {status: 'SUCCESS', msg: 'Created Employee',data: employee}, status: :ok
            else
                render json: {status: 'ERROR', msg: 'Employee not saved', data: employee.errors}, status: :server_error
            end
        rescue => e
            render json: {status: 'Internal Server Error', msg: e, data: nil}, status: :internal_server_error
        end
      end

      def update
        begin
          employee = Employee.find_by(id: params[:id])
          Rails.logger.info "&&&&&&&&&&&: #{employee}"
          if employee
              if employee.update_attributes(employee_params)
              render json: {status: 'SUCCESS', msg: 'Updated Employee',data: employee}, status: :ok
              else
                  render json: {status: 'ERROR', msg: 'Employee not updated', data: employee.errors}, status: :server_error
              end
          else
              render json: {status: 'Not Found', msg: 'Employee Id not found', data: nil}, status: :not_found
              return
          end
        rescue => e
          render json: {status: 'Internal Server Error', msg: e, data: nil}, status: :internal_server_error
        end
      end

      def destroy
        begin
          employee = Employee.find_by(id: params[:id])
          Rails.logger.info "&&&&&&&&&&&: #{employee}"
          if employee
              if employee.destroy
                  render json: {status: 'SUCCESS', msg: 'Deleted Employee',data: employee}, status: :ok
              else
                  render json: {status: 'ERROR', msg: 'Employee not deleted', data: employee.errors}, status: :server_error
              end
          else
              render json: {status: 'Not Found', msg: 'Employee Id not found', data: nil}, status: :not_found
              return
          end
        rescue => e
          render json: {status: 'Internal Server Error', msg: e, data: nil}, status: :internal_server_error
        end
      end

        def search_query
          begin
            if employee_params[:name] || employee_params[:designation] || employee_params[:qualificaton]
              employees = Employee.where("name LIKE :name OR designation LIKE :designation OR qualificaton LIKE :qualificaton", {:name => "#{employee_params[:name]}%", :designation=> employee_params[:designation], :qualificaton => employee_params[:qualificaton]})
            else
              employees = Employee.all
            end
            render json: employees
          rescue => e
            render json: {status: 'Internal Server Error', msg: e, data: nil}, status: :internal_server_error
          end
        end

        private

        def employee_params
          params.permit(:name, :emp_id, :designation, :qualificaton, :from_date, :is_super_admin)
        end
    end
  end
end