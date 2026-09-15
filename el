import os

def classificar_velocidade(v):
    """Retorna a classificação da velocidade."""
    if v <= 80:
        return "Normal"
    elif v <= 100:
        return "Infração"
    else:
        return "Infração Grave"

def limpar_tela():
    """Limpa o terminal de acordo com o sistema operacional."""
    os.system("cls" if os.name == "nt" else "clear")

def executar_sistema():
    # O loop 'while True' mantém o programa rodando continuamente
    while True:
        limpar_tela()
        print("=== REGISTRO DE VELOCIDADES ===")
        
        velocidades = []
        
        # Coleta 5 velocidades válidas
        for i in range(5):
            while True:
                try:
                    v = int(input(f"Digite a {i+1}ª velocidade (km/h): "))
                    if v > 0:
                        velocidades.append(v)
                        break
                    print("Por favor, digite uma velocidade maior que zero.")
                except ValueError:
                    print("Entrada inválida. Digite apenas números inteiros.")

        # Processamento e exibição do relatório
        limpar_tela()
        print("=== RELATÓRIO DAS VELOCIDADES ===")
        for v in velocidades:
            status = classificar_velocidade(v)
            print(f"• {v} km/h -> Status: {status}")
            
        media = sum(velocidades) / len(velocidades)
        maior = max(velocidades)
        
        print("-" * 35)
        print(f"Média registrada: {media:.1f} km/h")
        print(f"Maior velocidade: {maior} km/h")
        print("-" * 35)

        # Pergunta de continuidade para manter ou quebrar o loop
        resposta = input("\nDeseja registrar um novo lote? (s/n): ").strip().lower()
        if resposta != 's':
            print("Encerrando o programa. Até mais!")
            break

# Inicia o programa contínuo
executar_sistema()
